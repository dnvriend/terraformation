## 05-lambda-integration
A simple API endpoint that uses the aws_proxy integration to integrate with a lambda

## aws_proxy integration
With the [API Gateway Lambda Proxy Integration](https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html#api-gateway-create-api-as-simple-proxy) 
the setup is simple. If your API does not require content encoding or caching, you only need to do the following:

- set the integration's HTTP method to POST, 
- the integration endpoint URI to the ARN of the Lambda function invocation action of a specific Lambda function, 
- the credential to an IAM role with permissions to allow API Gateway to call the Lambda function on your behalf.

With the Lambda proxy integration, when a client submits an API request, API Gateway passes to the integrated Lambda function 
the raw request as-is. This request data includes the request headers, query string parameters, URL path variables, payload, 
and API configuration data. The configuration data can include current deployment stage name, stage variables, user identity, 
or authorization context (if any). The backend Lambda function parses the incoming request data to determine the response that 
it returns. For API Gateway to pass the Lambda output as the API response to the client, the Lambda function must return 
the result in this format:

The [JSON the Lambda must return](https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html#api-gateway-simple-proxy-for-lambda-output-format):
```json
{
    "isBase64Encoded": true|false,
    "statusCode": httpStatusCode,
    "headers": { "headerName": "headerValue", ... },
    "body": "..."
}
```

The [JSON the lambda receives](https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-lambda-proxy-integrations.html#api-gateway-simple-proxy-for-lambda-input-format): 

```json
{
    "resource": "Resource path",
    "path": "Path parameter",
    "httpMethod": "Incoming request's method name"
    "headers": {Incoming request headers}
    "queryStringParameters": {query string parameters }
    "pathParameters":  {path parameters}
    "stageVariables": {Applicable stage variables}
    "requestContext": {Request context, including authorizer-returned key-value pairs}
    "body": "A JSON string of the request payload."
    "isBase64Encoded": "A boolean flag to indicate if the applicable request payload is Base64-encode"
}
```

## usage
Type:

- make init: initializes a python
- make validate: validate a swagger.yaml
- make create: deploy the api
- make delete
- make mock

Have fun!