## 06-vpc-integration
A simple API endpoint that uses the vpc integration to call a service that is running in a public vpc. 
The service is a simple t3.micro instance, running httpd, running on port 80. API Gateway uses an http_proxy
integration with VPC_LINK connectionType that uses the VpcLinkId that has been created. The integration then sends
the request to the uri that has been set to point to the NetworkLoadBalancer that points to the EC2 instance. 

## Deployment of the NLB
Please note that the deployment of the `nlb` stack can take some time because of the NLB that must be deployed.
The deployment of the stack can take up to 15 minutes, this includes creating the vpc, ec2, nlb and the api. 

## Introduction
Since [2017-11-30, API Gateway supports endpoint integrations with Private VPCs](https://aws.amazon.com/about-aws/whats-new/2017/11/amazon-api-gateway-supports-endpoint-integrations-with-private-vpcs/).
This means you can use API Gateway to create an API endpoint that is integrated with your VPC. You create an endpoint to your 
VPC by setting up a VPC link between your VPC and a Network Load Balancer (NLB), which is provided by Elastic Load Balancing. 
The NLB send requests to multiple destinations in your VPC such as Amazon EC2 instances, Auto Scaling groups, or Amazon ECS services. 
NLBs also support private connectivity over AWS Direct Connect, so that applications in your own data centers will be able to connect 
to your VPC via the Amazon private network.

## API Gateway Integration
An [API Gateway integration](https://docs.aws.amazon.com/apigateway/api-reference/resource/integration/) is an object that specifies the integration with another resource, which can be a resource that is available on the 
internet or available in AWS. The object defines a lot of configuration options like the `type`, which can be HTTP, HTTP_PROXY, AWS, AWS_PROXY, or Mock,
but also `connectionType`, which can be `INTERNET` or `VPC_LINK`. Other options are `credentials` that specifies the role that API Gateway will assume to
integrate with a resource, most often used when invoking Lambda, `passthroughBehavior`, but also `uri` that contains the http url that will be used when used with
the `HTTP` or `HTTP_PROXY` integration type, and an ARN for `AWS` or `AWS_PROXY` integrations. 
The integration 

## VPC_LINK
The `connectionType` - the type of the network connection to the integration endpoint - can be `VPC_LINK` or `INTERNET`. A VPC_LINK connectionType 
is referred to as a private integration and uses a VpcLink to connect API Gateway to a network load balancer of a VPC.
When a VpcLink is created, you get an ID and that ID must be set on the `connectionId` property of the Integration.
 
## How to setup vpc (private) integrations
see: https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-private-integration.html

## usage
Type:

- make create: deploy the environment
- make delete: delete the environment
- make info: shows info about the deployed environment
- make deploy: delete -> create -> info

Have fun!