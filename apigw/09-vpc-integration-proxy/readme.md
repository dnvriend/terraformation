## 09-vpc-integration-proxy
A simple API endpoint that uses the vpc integration to call a service that is running in a public vpc. 
The service is a simple t3.micro instance, running httpbin, running on port 80. ApiGateway integrates 
with [Proxy Integration](http://docs.amazonaws.cn/en_us/apigateway/latest/developerguide/setup-http-integrations.html). 

## usage
Type:

- make create: deploy the environment
- make delete: delete the environment
- make info: shows info about the deployed environment
- make deploy: delete -> create -> info

## Resources
- [Setup http integration](http://docs.amazonaws.cn/en_us/apigateway/latest/developerguide/setup-http-integrations.html)
- [ApiGateway setup simple proxy](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-set-up-simple-proxy.html).

Have fun!