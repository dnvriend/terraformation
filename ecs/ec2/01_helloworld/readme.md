# 01_helloworld
This example does the following:
- create a vpc
- create an ecs cluster
- launch a t3.small and install the ecs cluster
- create an ecs/ec2 task to run the container 'httpbin'

## How to use
Type:

- make create
- make delete
- make info

Type `make info`, search for the public-ip of the ec2 instance and connect. You get a page that describes how to use
the httpbin testing service.

## Resources
- [httpbin container](https://hub.docker.com/r/kennethreitz/httpbin/)