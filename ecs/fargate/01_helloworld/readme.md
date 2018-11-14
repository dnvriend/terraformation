# 01_helloworld
This example does the following:
- create an ecr repo
- build, tags and upload a custom nginx image with custom index.html
- create a vpc with public subnet for the container
- create an ecs cluster + vpc security group + roles for ecs
- create an ecs/fargate task to run the container

## How to use
Type:

- make create
- make info
- make delete
- make get_ip

## Resources
- [nathanpeck/aws-cloudformation-fargate](https://github.com/nathanpeck/aws-cloudformation-fargate)