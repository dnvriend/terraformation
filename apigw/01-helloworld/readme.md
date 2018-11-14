# 02-helloworld
An example that shows how to deploy an apigateway with a swagger v2.0 definition that contains a single resource that
returns the `helloworld` entity.

## Description
The project creates two stacks, the `bucket` stack that creates a bucket to hold the `swagger.yaml` definition, and the
`api` stack that will create a `RestApi`, a `Deploy` and a `Stage`.

## Usage
Type `make create`, `make delete` and `make info`. Make info shows the ServiceEndpoint.

## Download Swagger API Spec
The Swagger API Spec can only be downloaded with the [AWS CLI - get-export](https://docs.aws.amazon.com/cli/latest/reference/apigateway/get-export.html) or SDK:

```bash
# only swagger
$ aws apigateway get-export \
    --rest-api-id <rest_api_id> \
    --stage-name <stage_name> \
    --accepts <application/yaml | application/json> \
    --export-type swagger /path/to/filename.json

# swagger + api gateway extensions
aws apigateway get-export \
    --parameters extensions='integrations' \
    --rest-api-id <rest_api_id> \ 
    --stage-name <stage_name> \
    --accepts <application/yaml | application/json> \
    --export-type swagger /path/to/filename.json
     
# swagger + postman extensions
$ aws apigateway get-export \
    --parameters extensions='postman' \
    --rest-api-id <rest_api_id> \
    --stage-name <stage_name> \
    --accepts <application/yaml | application/json> \
    --export-type swagger /path/to/filename.json
```

## Resources
- [API Gateway Extensions to Swagger](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html)
- [Open Source API Gateway Developer Guide](https://github.com/awsdocs/amazon-api-gateway-developer-guide)
- [x-amazon-apigateway-integration](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-integration.html)
- [x-amazon-apigateway-documentation](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-documentation.html)

Have fun!