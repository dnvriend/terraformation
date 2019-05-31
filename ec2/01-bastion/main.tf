locals {
  debug = false
}

# read dnvriend-key
data "template_file" "dnvriend-key" {
  template = "${file("${path.module}/dnvriend-key.pub")}"
}

# read dnvriend2-key
data "template_file" "dnvriend2-key" {
  template = "${file("${path.module}/dnvriend2-key.pub")}"
}


# Render a part using a `cloud-init.tpl`
data "template_file" "script" {
  template = "${file("${path.module}/cloud-init.tpl")}"

  vars {
    dnvriend_key = "${data.template_file.dnvriend-key.rendered}"
    dnvriend2_key = "${data.template_file.dnvriend2-key.rendered}"
  }
}

# Render a multi-part cloud-init config making use of the part
# above, and other source files
data "template_cloudinit_config" "config" {
  gzip          = "${true && !local.debug}"
  base64_encode = "${true && !local.debug}"

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = "${data.template_file.script.rendered}"
  }

//  part {
//    content_type = "text/x-shellscript"
//    content      = "baz"
//  }
//
//  part {
//    content_type = "text/x-shellscript"
//    content      = "ffbaz"
//  }
}

# firewall that allows ssh
resource "aws_security_group" "this" {
  name = "bastion_security_group"
  description = "bastion-allow-ssh"
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags {
    name = "bastion-allow-ssh"
  }
}

# Start a Bastion instance with the cloud-init config as user data
resource "aws_instance" "bastion" {
  ami              = "${data.aws_ami.amazon_linux_ami.image_id}"
  instance_type    = "t2.micro"
  user_data_base64 = "${data.template_cloudinit_config.config.rendered}"
  security_groups = ["${aws_security_group.this.name}"]
  iam_instance_profile = "${aws_iam_instance_profile.this.name}"
}

resource "aws_iam_instance_profile" "this" {
  role = "${aws_iam_role.this.name}"
}

resource "aws_iam_role" "this" {
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.this.json}"
}

resource "aws_iam_role_policy_attachment" "AmazonEC2RoleforSSM" {
  role       = "${aws_iam_role.this.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_ami" "amazon_linux_ami" {
  most_recent = true

  owners = [
    "amazon",
  ]

  filter {
    name = "name"

    values = [
      "amzn2-ami-hvm-2.0.20190313-x86_64-gp2",
    ]
  }

  filter {
    name = "architecture"

    values = [
      "x86_64",
    ]
  }

  filter {
    name = "root-device-type"

    values = [
      "ebs",
    ]
  }

  filter {
    name = "virtualization-type"

    values = [
      "hvm",
    ]
  }
}