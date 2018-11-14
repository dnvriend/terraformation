# Terraformation

[![License](http://img.shields.io/:license-Apache%202-red.svg)](http://www.apache.org/licenses/LICENSE-2.0.txt)

A repository of templates for AWS, on how to create resources with [AWS CloudFormation](https://aws.amazon.com/cloudformation/),
[Hashicorp Terraform](https://www.terraform.io/) and [sceptre](https://sceptre.cloudreach.com/latest/).

## Sceptre
[Sceptre](https://sceptre.cloudreach.com/latest/) is a tool to drive [AWS CloudFormation](https://aws.amazon.com/cloudformation/). 
Sceptre manages the creating, updating and deletion of stacks, and provides meta commands to allow users to get information about their stacks. 

## Troposphere
[Troposphere](https://github.com/cloudtools/troposphere/) is a Python DSL for creating CloudFormation descriptions. It can be
used in combination with [Sceptre Templating](https://sceptre.cloudreach.com/latest/docs/templates.html).

## Awacs
[Awacs](https://github.com/cloudtools/awacs) is a Python library for AWS Access Policy Language creation.

## Jinja
Using [Sceptre Templates](https://sceptre.cloudreach.com/latest/docs/templates.html), templates with `.j2` extensions are treated 
as Jinja2 templates. These are rendered and should create a raw JSON or YAML CloudFormation template.

## Python templates
Using [Sceptre Templates](https://sceptre.cloudreach.com/latest/docs/templates.html), templates with a `.py` extension are treated 
as Python templates and should returns a CloudFormation template as a JSON or YAML string.

## CloudFormation
To execute the CloudFormation examples, type:

- make create
- make update
- make delete

## terraform
To execute the terraform examples, type:

- make init 
- make plan
- make apply
- make destroy

## Resources
- [CloudFormation Documentation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [Alternatives: Sceptre + Troposphere](https://techblog.telia.no/blog/pains-with-terraform-perhaps-use-sceptre-next-time/)
- [YAML - Break a string over multiple lines](https://stackoverflow.com/questions/3790454/in-yaml-how-do-i-break-a-string-over-multiple-lines)
- [OpenAPI Spec Validator (Python)](https://github.com/p1c2u/openapi-spec-validator)
- [What is Swagger](https://swagger.io/docs/specification/about/)
- [Swagger 2.0 Spec](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md)
- [Zalando Connexxtion](https://github.com/zalando/connexion)
- [Zalando Connexxion - Docs](https://connexion.readthedocs.io/en/latest/)
- [Zalando Connexxion - Pet Example](https://github.com/hjacobs/connexion-example)

Have fun!