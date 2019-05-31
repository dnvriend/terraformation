There are several commonly used filename extensions for X.509 certificates. Unfortunately, some of these extensions are also used for other data such as private keys.

.pem – (Privacy-enhanced Electronic Mail) Base64 encoded DER certificate, enclosed between "-----BEGIN CERTIFICATE-----" and "-----END CERTIFICATE-----"
.cer, .crt, .der – usually in binary DER form, but Base64-encoded certificates are common too (see .pem above)
.p7b, .p7c – PKCS#7 SignedData structure without data, just certificate(s) or CRL(s)
.p12 – PKCS#12, may contain certificate(s) (public) and private keys (password protected)
.pfx – PFX, predecessor of PKCS#12 (usually contains data in PKCS#12 format, e.g., with PFX files generated in IIS)

Generate a key:
1. ssh-keygen -t rsa -C "your-username or mail address" -b 4096 -f ~/.ssh/my-new-key
2. copy your private key: pbcopy < ~/.ssh/my-new-key
3. copy your public key: pbcopy < ~/.ssh/my-new-key.pub


for example:

```bash
# create two keys
ssh-keygen -t rsa -C "dnvriend" -b 4096 -f ~/.ssh/dnvriend-key
ssh-keygen -t rsa -C "dnvriend2" -b 4096 -f ~/.ssh/dnvriend2-key
cp ~/.ssh/dnvriend-key.pub .
cp ~/.ssh/dnvriend2-key.pub .

# deploy the bastion host 
terraform apply -auto-approve

# login to the instance

```

## ssm-agent
SSM Agent is preinstalled, by default, on the following Amazon Machine Images (AMIs):

- Amazon Linux
- Amazon Linux 2
- Ubuntu Server 16.04
- Ubuntu Server 18.04 

## debug cloud-init
Log in to the instance with the AWS Session Manager. Then `sudo cat /var/log/boot.log` to find any errors. You shouldn't see
any 'parse yaml errors'. Then `sudo cat /var/log/cloud-init.log  | grep dnvriend` to check if users and ssh keys have been added.  

```text
ay 31 12:01:26 cloud-init[3044]: __init__.py[DEBUG]: Adding user dnvriend2
May 31 12:01:26 cloud-init[3044]: util.py[DEBUG]: Running hidden command to protect sensitive input/output logstring: ['useradd', 'dnvriend2', '--comment', 'Dennis Vriend 2', '--groups', 'wheel', '--shell', '/bin/bash', '-m']
May 31 12:01:26 cloud-init[3044]: util.py[DEBUG]: Running command ['passwd', '-l', 'dnvriend2'] with allowed return codes [0] (shell=False, capture=True)
May 31 12:01:26 cloud-init[3044]: util.py[DEBUG]: Changing the ownership of /home/dnvriend2/.ssh to 1000:1000
May 31 12:01:26 cloud-init[3044]: util.py[DEBUG]: Writing to /home/dnvriend2/.ssh/authorized_keys - wb: [600] 743 bytes
May 31 12:01:26 cloud-init[3044]: util.py[DEBUG]: Changing the ownership of /home/dnvriend2/.ssh/authorized_keys to 1000:1000
May 31 12:01:26 cloud-init[3044]: __init__.py[DEBUG]: Adding user dnvriend
May 31 12:01:26 cloud-init[3044]: util.py[DEBUG]: Running hidden command to protect sensitive input/output logstring: ['useradd', 'dnvriend', '--comment', 'Dennis Vriend', '--groups', 'wheel', '--shell', '/bin/bash', '-m']
May 31 12:01:26 cloud-init[3044]: util.py[DEBUG]: Running command ['passwd', '-l', 'dnvriend'] with allowed return codes [0] (shell=False, capture=True)
May 31 12:01:26 cloud-init[3044]: util.py[DEBUG]: Changing the ownership of /home/dnvriend/.ssh to 1002:1002
May 31 12:01:26 cloud-init[3044]: util.py[DEBUG]: Writing to /home/dnvriend/.ssh/authorized_keys - wb: [600] 742 bytes
May 31 12:01:26 cloud-init[3044]: util.py[DEBUG]: Changing the ownership of /home/dnvriend/.ssh/authorized_keys to 1002:1002
May 31 12:01:38 cloud-init[3338]: __init__.py[INFO]: User dnvriend2 already exists, skipping.
May 31 12:01:38 cloud-init[3338]: util.py[DEBUG]: Running command ['passwd', '-l', 'dnvriend2'] with allowed return codes [0] (shell=False, capture=True)
May 31 12:01:38 cloud-init[3338]: util.py[DEBUG]: Reading from /home/dnvriend2/.ssh/authorized_keys (quiet=False)
May 31 12:01:38 cloud-init[3338]: util.py[DEBUG]: Read 743 bytes from /home/dnvriend2/.ssh/authorized_keys
May 31 12:01:38 cloud-init[3338]: util.py[DEBUG]: Writing to /home/dnvriend2/.ssh/authorized_keys - wb: [600] 743 bytes
May 31 12:01:38 cloud-init[3338]: util.py[DEBUG]: Changing the ownership of /home/dnvriend2/.ssh/authorized_keys to 1000:1000
May 31 12:01:38 cloud-init[3338]: __init__.py[INFO]: User dnvriend already exists, skipping.
May 31 12:01:38 cloud-init[3338]: util.py[DEBUG]: Running command ['passwd', '-l', 'dnvriend'] with allowed return codes [0] (shell=False, capture=True)
May 31 12:01:38 cloud-init[3338]: util.py[DEBUG]: Reading from /home/dnvriend/.ssh/authorized_keys (quiet=False)
May 31 12:01:38 cloud-init[3338]: util.py[DEBUG]: Read 742 bytes from /home/dnvriend/.ssh/authorized_keys
May 31 12:01:38 cloud-init[3338]: util.py[DEBUG]: Writing to /home/dnvriend/.ssh/authorized_keys - wb: [600] 742 bytes
May 31 12:01:38 cloud-init[3338]: util.py[DEBUG]: Changing the ownership of /home/dnvriend/.ssh/authorized_keys to 1002:1002
``` 

## Resources:
- [Working with SSM Agent](https://docs.aws.amazon.com/systems-manager/latest/userguide/ssm-agent.html)
 