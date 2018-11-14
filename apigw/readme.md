## API Gateway Examples
A small study project on API Gateway. A big part of API Gateway 
is [swagger](https://swagger.io/) aka. [OpenAPI Spec](https://en.wikipedia.org/wiki/OpenAPI_Specification), 
a project used to describe and document RESTful APIs.

The Swagger specification defines a set of files required to describe such an API. These files can then be used by the Swagger-UI 
project to display the API and Swagger-Codegen to generate clients in various languages. Additional utilities can also take 
advantage of the resulting files, such as testing tools.

## Select a VTL Mapping Template
API Gateway uses the following logic to select a mapping template, in Velocity Template Language (VTL), to map the payload from 
a method request to the corresponding integration request or to map the payload from an integration response to the 
corresponding method response.

**Request Payload**:
For a request payload, API Gateway uses the request’s `Content-Type` header value as the key to select the mapping template 
for the request payload. For a response payload, API Gateway uses the incoming request’s `Accept` header value as the key 
to select the mapping template.

When the `Content-Type` header is absent in the request, API Gateway assumes that its default value is `application/json`. 
For such a request, API Gateway uses `application/json` as the default key to select the mapping template, if one is defined. 
When no template matches this key, API Gateway passes the payload through unmapped if the `passthroughBehavior` property is set 
to `WHEN_NO_MATCH` or `WHEN_NO_TEMPLATES`.

When the Accept header is not specified in the request, API Gateway assumes that its default value is `application/json`.
 In this case, API Gateway selects an existing mapping template for `application/json` to map the response payload. 

If no template is defined for `application/json`, API Gateway selects the `first existing template` and uses it as the 
default to map the response payload. Similarly, API Gateway uses the first existing template when the specified 
`Accept` header value does not match any existing template key. If no template is defined, API Gateway simply 
passes the response payload through unmapped.

For example, suppose that an API has a application/json template defined for a request payload and has a application/xml template 
defined for the response payload. If the client sets the "Content-Type : application/json", and "Accept : application/xml" headers 
in the request, both the request and response payloads will be processed with the corresponding mapping templates. 
If the Accept:application/xml header is absent, the application/xml mapping template will be used to map the response payload. 
To return the response payload unmapped instead, you must set up an empty template for application/json.

Only the MIME type is used from the Accept and Content-Type headers when selecting a mapping template. For example, a header of 
"Content-Type: application/json; charset=UTF-8" will have a request template with the application/json key selected.

## Integration Request as GET with Body
API Gateway does not forward a body when the integration request is a GET. THe body will be received as an empty
String.

## Proxy vs Non-Proxy Integration

## HttpStatus Code in Integration Response Template Mapping
see: https://stackoverflow.com/questions/41670400/api-gateway-get-statuscode
You DO NOT have access to the HTTP status code in the response template mapping. Also, you cannot have multiple
response templates map to the same integration method response like say an IR400 to MR200 and IR500 to MR200.

A possible solution is to have all status codes received from the backend defined in the swagger responses, 
and having a one-to-one mapping from these messages from the integration responses to the method responses.
Then, in the integration response templates OVERRIDE the status code with the following statement:

```vtl
#set($context.responseOverride.status = 200)
```

This will force the response to be a `200` in this case, although the mapping is eg. a IR400 -> MR400, the 
status code code will be a `200`.  

## Resources
- [swagger-specificion](https://swagger.io/docs/specification/about/)
- [swagger 2.0 specification](https://swagger.io/docs/specification/2-0/basic-structure/)
- [OpenAPI 2.0 specification](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md)
- [swagger-editor](https://editor.swagger.io/)
- [swagger-hub](https://swagger.io/tools/swaggerhub/)
- [Zalando - Connexion](https://github.com/zalando/connexion)
- [Henning Jacobs - Connexion Example](https://github.com/hjacobs/connexion-example)
- [Httpie - Documentation](https://httpie.org/doc)
- [Online Regex](https://regex101.com/)
- [Microsoft - RegEx Quick Reference](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
- [Zalando - IntelliJ Swagger Extension](https://github.com/zalando/intellij-swagger/tree/master/examples/extensions-zalando)
- [Choose an API Gateway API Integration Type](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-api-integration-types.html)
- [Set up Request and Response Data Mappings Using the API Gateway Console](https://docs.aws.amazon.com/apigateway/latest/developerguide/how-to-method-settings-execution-console.html)
- [API Gateway Mapping Template Reference](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-mapping-template-reference.html)
- [Understanding API Gateway Payload Mappings](https://sookocheff.com/post/api/understanding-api-gateway-payload-mappings/)
- [Integration Passthrough Behaviors](https://docs.aws.amazon.com/apigateway/latest/developerguide/integration-passthrough-behaviors.html)
- [Select a VTL Mapping Template](https://docs.aws.amazon.com/apigateway/latest/developerguide/request-response-data-mappings.html#transforming-request-response-body)
- [Map Method Request Data to Integration Request Parameters](https://docs.aws.amazon.com/apigateway/latest/developerguide/request-response-data-mappings.html#mapping-request-parameters)
- [Map Integration Response Data to Method Response Headers](https://docs.aws.amazon.com/apigateway/latest/developerguide/request-response-data-mappings.html#mapping-response-parameters)
- [Set up Method Responses in API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-method-settings-method-response.html)
- [x-amazon-apigateway-integration](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-integration.html)
- [x-amazon-apigateway-integration.responses](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-integration-responses.html)
- [x-amazon-apigateway-integration.response](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-integration-response.html)
- [API Gateway caching - some things that surprised me](https://medium.com/@dougmoscrop/i-set-up-api-gateway-caching-here-are-some-things-that-surprised-me-7526d954fbe6)
- [Set up API with Private Integrations Using OpenAPI](https://docs.aws.amazon.com/apigateway/latest/developerguide/set-up-api-with-vpclink-using-swagger.html)
- [API Gateway - Get StatusCode](https://stackoverflow.com/questions/41670400/api-gateway-get-statuscode)

## cfn-certificate-provider
The [cfn-certificate-provider](https://github.com/binxio/cfn-certificate-provider) is a custom CloudFormation resource 
provider for creating DNS validated certificates in AWS.

As a prerequisite, you need to have the hosted zones for the domain names on your certificate in Route53. If you have that,
you can fully automate the provisioning of certificates, with the following resources:

- `Custom::Certificate` to request a certificate without waiting for it to be issued
- `Custom::CertificateDNSRecord` which will obtain the DNS record for a domain name on the certificate.
- `Custom::IssuedCertificate` which will activately wait until the certificate is issued.
- `AWS::Route53::ResourceRecordSet` to create the validation DNS record.

## aws-cfn-update
The tool [aws-cfn-update](https://github.com/binxio/aws-cfn-update), provided by [binx.io](https://binx.io/),
supports updating the rest-api-body and merging the [api-gateway-extensions](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions.html)
into the open-api/swagger body.

```text
Usage: aws-cfn-update rest-api-body [OPTIONS] PATH...

Updates the body of a REST API Resource, with an standard Open API
specification merged with AWS API Gateway extensions.

If you specify --add-new-version, it will create a new version of the
resource and update all references to it. This will enforce the deployment
of the new api.

If you want to keep the previous definition, specify --keep to a value of
2 or higher. This might be handy if you have old clients still accessing
the old version of the API.

If no changes are detected, no changes are made. Please make sure that all
dictionary keys in th specifications are strings, not integers (especially
the case with `responses`). When updating json CFN templates, the compare
algorithm does not work properly.

Options:
  --resource TEXT                AWS::ApiGateway::RestApi body to update
                                 [required]
  --open-api-specification PATH  defining the interface  [required]
  --api-gateway-extensions PATH  to add the the specification  [required]
  --add-new-version              of the RestAPI resource and replace all
                                 references
```
