## 10-authentication-identity-pool
A simple API endpoint that uses the vpc integration to call a service that is running in a public vpc. 
The service is a simple t3.micro instance, running httpbin, running on port 80. ApiGateway integrates 
with [Proxy Integration](http://docs.amazonaws.cn/en_us/apigateway/latest/developerguide/setup-http-integrations.html). 

## usage
Type:

- make create: deploy the environment
- make delete: delete the environment
- make info: shows info about the deployed environment
- make deploy: delete -> create -> info

## HttpBin
[Httpbin](https://httpbin.org/) exposes the following resources:

- /anything: Returns anything that is passed to request 

## API Call:

```text
http https://3lkfs1rkzj.execute-api.eu-west-1.amazonaws.com/dev/anything
```

## Cognito
The indentity_pool is called: ` dnvriend_pool`

## CLI
```
aws cognito-identity
==========================================================================================
create-identity-pool                     | delete-identities                       
delete-identity-pool                     | describe-identity                       
describe-identity-pool                   | get-credentials-for-identity            
get-id                                   | get-identity-pool-roles                 
get-open-id-token                        | get-open-id-token-for-developer-identity
list-identities                          | list-identity-pools                     
lookup-developer-identity                | merge-developer-identities              
set-identity-pool-roles                  | unlink-developer-identity               
unlink-identity                          | update-identity-pool                    
help                                    

$ aws cognito-identity list-identity-pools --max-results 10
{
    "IdentityPools": [
        {
            "IdentityPoolId": "eu-west-1:d45713bf-5167-4396-8567-9ea267541836", 
            "IdentityPoolName": "dnvriend_pool"
        }
    ]
}

$ aws cognito-identity describe-identity-pool --identity-pool-id eu-west-1:d45713bf-5167-4396-8567-9ea267541836
{
    "IdentityPoolId": "eu-west-1:d45713bf-5167-4396-8567-9ea267541836", 
    "AllowUnauthenticatedIdentities": true, 
    "IdentityPoolName": "dnvriend_pool"
}

# Generates (or retrieves) a Cognito ID. Supplying multiple logins will create an implicit linked account.
$ aws cognito-identity get-id --identity-pool-id eu-west-1:d45713bf-5167-4396-8567-9ea267541836
{
    "IdentityId": "eu-west-1:afd8d07a-b65e-49a1-91c7-674331b56008"
}

$ aws cognito-identity list-identities --identity-pool-id eu-west-1:d45713bf-5167-4396-8567-9ea267541836 --max-results 10
{
    "IdentityPoolId": "eu-west-1:d45713bf-5167-4396-8567-9ea267541836", 
    "Identities": [
        {
            "LastModifiedDate": 1538078988.077, 
            "CreationDate": 1538078988.077, 
            "IdentityId": "eu-west-1:afd8d07a-b65e-49a1-91c7-674331b56008"
        }
    ]
}

$ aws cognito-identity describe-identity --identity-id eu-west-1:afd8d07a-b65e-49a1-91c7-674331b56008
{
    "LastModifiedDate": 1538078988.077, 
    "CreationDate": 1538078988.077, 
    "IdentityId": "eu-west-1:afd8d07a-b65e-49a1-91c7-674331b56008"
}

# Returns credentials for the provided identity ID. Any provided logins will be validated against supported login providers. 
# If the token is for cognito-identity.amazonaws.com, it will be passed through to AWS Security Token Service with the 
# appropriate role for the token.
#
# This is a public API. You do not need any credentials to call this API.
#
$ aws cognito-identity get-credentials-for-identity --identity-id eu-west-1:afd8d07a-b65e-49a1-91c7-674331b56008
{
    "Credentials": {
        "SecretKey": "abcdefgabcdefg", 
        "SessionToken": "abcdefgabcdefg", 
        "Expiration": 1538497905.0, 
        "AccessKeyId": "ABCDEFGABCDEFG"
    }, 
    "IdentityId": "eu-west-1:afd8d07a-b65e-49a1-91c7-674331b56008"
}

# Gets an OpenID (JWT) token, using a known Cognito ID. This known Cognito ID is returned by GetId. You can optionally 
# add additional logins for the identity. Supplying multiple logins creates an implicit link.
#
# The OpenId token is valid for 10 minutes.
#
# This is a public API. You do not need any credentials to call this API.
#
$ aws cognito-identity get-open-id-token --identity-id eu-west-1:afd8d07a-b65e-49a1-91c7-674331b56008
{
    "Token": "eyJraWQiOiJldS13ZXN0LTExIiwidHlwIjoiSldTIiwiYWxnIjoiUlM1MTIifQ.eyJzdWIiOiJldS13ZXN0LTE6YWZkOGQwN2EtYjY1ZS00OWExLTkxYzctNjc0MzMxYjU2MDA4IiwiYXVkIjoiZXUtd2VzdC0xOmQ0NTcxM2JmLTUxNjctNDM5Ni04NTY3LTllYTI2NzU0MTgzNiIsImFtciI6WyJ1bmF1dGhlbnRpY2F0ZWQiXSwiaXNzIjoiaHR0cHM6Ly9jb2duaXRvLWlkZW50aXR5LmFtYXpvbmF3cy5jb20iLCJleHAiOjE1Mzg0OTUwMzcsImlhdCI6MTUzODQ5NDQzN30.LaFitjN_ogucLotS6rpIcCnfQMDIN9NDfQt1BM77lSTPacveYyHUgTghyLtOQLKxX2XjXRhzwzjRtzJPgnGXBY12xRWML-TG_Ip4uGOlpSWdGc9LnaMZk2Pmal73G8ZmT9eJhZyzcYWFI15uTibHsxR3LifIGhv-9EOOfprTgZ49BGEx1881-7xry0eY7NkF-v-R-imvDIcS56UoSwL76NGMDWLRVbET9WAo3JybhTZT6tFJGrUzTFKlBUtTCuuP5GpmHWp_wx3e0FoK-0Fr2hRfb5FjMfXrarJ56BgYDxW4JY6TQkEmJZlPD7NIYDkQDMpikGw0TT1kZw7wX1mKsA", 
    "IdentityId": "eu-west-1:afd8d07a-b65e-49a1-91c7-674331b56008"
}

$ aws cognito-identity get-credentials-for-identity --identity-id eu-west-1:afd8d07a-b65e-49a1-91c7-674331b56008

$ http https://3lkfs1rkzj.execute-api.eu-west-1.amazonaws.com/dev/anything "Authorization:Bearer AgoGb3JpZ2luEDMaCWV1LXdlc3QtMSKAAjPdMcDQ3V//lbuB0ViwHdmTB6e8msgV9ubn5N7AxmyUBC2De98Bw4pJOgqHmiFu83Es9ZsuJDAzWfiFk7ZF7QOcSVCWv9ZMpdIDB8KGXCBevU2kidYQcB8AA6ULxv2mSr0XSZIjz8XXhb57gi57E9radk9IUzd5B1SjMGAl5ki+S6P0TaeoK15/hvphWjvjSrm4/hHEiIwjq2ONgxm4dvJ61JCkdoAmZABu9CJsuVxmdBIab/meZ9qqsTnyKpWPoC+Ph8y4dOO8me7/Hl9hrP9HuHzi+sCF2cgI4f8l/xHRW1vjMcRIL9fqvwrjVPmVAj+rGZ89XbNes8CgLwrI6rQqmAYIeBAAGgw2MTI0ODM5MjQ2NzAiDL/OdwoN73IiifRQ7Cr1BVrGWT4M+g1mYatVZTBDFDwkPdK7351wDY29MyRKVLPV7Hpcd72/Av+euJ7bN7nTe6nthgxytZMfcu+0L7rpIkY3Z5QVclIEJ4YPs94rf+oH79p88HrPT+ROMzM9K14r+/THPnoqb73yoa7X5qtwwFj0j+Lf4MizheLqRA/PKekox5QCPWPNK2zx6Y3VGnL5xn++rT8yrNTwQq6WJGb/CBs9uG1bmDznIHl6GUDDREP63+I/+54bpV20lqaeS6tMy0fdZx7rt40brcODck6l/xPeu1Wp78Irwc2dtdDyo6xEukCEny0pgHF589eb2CqO0/fKiJ6s1cU9p9sjSWZoVjNNGXlAXYoENwYDrDfxZA42lf0QwmigV5KySD0vB94Qgz4NF6+eyaqEqQqgRoDJP56v+hUkoLv9yPyRNZJgzlr4IIUiOry2SWEfyRej1QXLqxQ+vLP/HSnuTpFQfPNUzwqUlMkrCRN6QS7kd0xcFh/VVVI0Obpjwq3QYdOPxMtJHqaOqMQr3dhOk4oO22NFYYATz2sNWIIbOtnYMEp3lZhNaAB3NwJNvj+G6t32GoPHFACNOlGJQR6PxlsijiBmQomrSU2X9mAvdDJOzzVzQA6SXOnjMGfPxlhazCVsi46q2jt3qZLGauGozxB/4abWrg0IwR5y7U2HXn04FLrU2SX6FVosC5JG5kDrv/dTT8eI9rYfk2Gc0FrOYquda9+opiOCcgYZqSM5Cp++VPUZxejqzhBxdYEzHrOIf2Wm2DiWmwX8D/GXHL6z3KsdQj0DYLXpjccC/zPleGk4cUehXX5wvLdgsCG6wQC/PkuwGjPUYQgjtFhnJeixnNzE++N/tHbtbcIRFaf3G+KZIz1mR2Ix7bFoEJvwlmDcNXxUibwXxTDNg0n103mlCFYPG8VnfLhHhGjdUO5Nd68n03fG46r6dG8PNw5kAA7WBedToVf1zIA/3uICT6DczZ3s1ALfdJ3WzbQwWWk8jApk087kM4XSSD6fTaUwopjO3QU="
```

Decoding the OpenId token using jwt.io:

```json
{
  "sub": "eu-west-1:afd8d07a-b65e-49a1-91c7-674331b56008",
  "aud": "eu-west-1:d45713bf-5167-4396-8567-9ea267541836",
  "amr": [
    "unauthenticated"
  ],
  "iss": "https://cognito-identity.amazonaws.com",
  "exp": 1538495037,
  "iat": 1538494437
}
```

## Resources
- [Setup http integration](http://docs.amazonaws.cn/en_us/apigateway/latest/developerguide/setup-http-integrations.html)
- [ApiGateway setup simple proxy](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-set-up-simple-proxy.html).

Have fun!