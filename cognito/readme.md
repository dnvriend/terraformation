# cognito
Amazon Cognito provides authentication, authorization, and user management for your web and mobile apps. Your users can sign 
in directly with a user name and password, or through a third party such as Facebook, Amazon, or Google.

The two main components of Amazon Cognito are user pools and identity pools. User pools are user directories that provide 
sign-up and sign-in options for your app users. Identity pools enable you to grant your users access to other AWS services. 
You can use identity pools and user pools separately or together.

## Cognito Services
Cognito provides three different services:

- [Amazon Cognito Federated Identities](http://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html)
- [Amazon Cognito User Pools](http://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html)
- [Amazon Cognito Sync](http://docs.aws.amazon.com/cognito/latest/developerguide/cognito-sync.html)

One service doesn’t need the other to work; however, they can be configured to work together.

## Amazon Cognito Federated Identities
To use [Amazon Cognito Federated Identities](http://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html) 
in your application, create an identity pool. An identity pool is a store of user data specific to your account. It can be 
configured to require an identity provider (IdP) for user authentication. IdPs are eg. Amazon, Google, Facebook, Twitter, **Cognito User Pools**, 
SAML, OpenID Connect, Developer Authenticated Identities. IdPs provide an identity and can come from many sources. You must enter details 
such as app IDs or keys related to the specific IdP to make federated identities work.

After the user is validated, the provider sends an identity token to Amazon Cognito Federated Identities. In turn, 
Amazon Cognito Federated Identities contacts the AWS Security Token Service (AWS STS) to retrieve temporary AWS credentials 
based on a configured, authenticated IAM role linked to the identity pool. The role has appropriate IAM policies attached 
to it and uses these policies to provide access to other AWS services.

Examples of Amazon Services that can be accessed are:
- Api Gateway
- AWS Lambda
- Amazon EC2
- Amazon S3
- Amazon RDS
- Amazon Kinesis
- Amazon SNS
- Amazon IoT

In a nutshell, [Amazon Cognito Federated Identities](http://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html) 
can be compared to a token vending machine that uses STS as a backend. The simplified user authentication flow 
for a given provider is:

1. App sends user credentials to provider, usually user name and password.
2. After the user is authenticated, the provider sends a valid token back to the application.
3. The application sends the token to the identity pool associated with it.
4. Amazon Cognito Federated Identities validates the token with the IdP (that you configure).
5. If the token is valid, Amazon Cognito Federated Identities contacts STS to retrieve temporary access credentials 
(access key, secret key, and session token) based on the authenticated IAM role associated with the identity pool.
6. App contacts the specific AWS service with the temporary credentials.

## Unauthenticated Access
If you don’t want to use an IdP, Amazon Cognito Federated Identities can also support unauthenticated identities by 
providing a unique identifier and AWS credentials for users who do not authenticate with an IdP. If your application 
allows customers to connect as a guest user without logging in, you can enable access for unauthenticated identities. 
In that case, STS sends temporary credentials based on a specific unauthenticated IAM role with appropriate policies. 
In these cases, AWS strongly recommends that you stick with the principle of the least privilege, only allowing access 
to perform a certain task and nothing else.

Amazon Cognito has the ability to allow unauthenticated guest access in your applications. If this feature is enabled in 
your identity pool, users can request a new identity ID at any time via the GetId API. The application is expected to 
cache this identity ID to make subsequent calls to Amazon Cognito. The AWS Mobile SDKs as well as the AWS SDK for JavaScript 
in the Browser have credentials providers that handle this caching for you.

To obtain a token for an unauthenticated identity, you only need the identity ID itself. It is not possible to get 
an unauthenticated token for authenticated or disabled identities.

## Authenticated Access
When you've configured your application with support for a public login provider (Facebook, Google+, Login with Amazon), 
users will also be able to supply tokens (OAuth or OpenID Connect) that identify them in those providers. When used in a 
call to GetId, Amazon Cognito will either create a new authenticated identity or return the identity already associated 
with that particular login. Amazon Cognito does this by validating the token with the provider and ensuring that:

- The token is valid and from the configured provider
- The token is not expired
- The token matches the application identifier created with that provider (e.g., Facebook app ID)
- The token matches the user identifier

## Amazon User Pools
Amazon Cognito User Pools, on other hand is a full-fledged IdP that you can use to maintain a user directory and add 
sign-up and sign-in support to your mobile or web application. It uses JSON Web Tokens (JWTs) to authenticate and validate users. 

_[JWT](https://jwt.io/) is an open standard that defines a compact and self-contained way for securely transmitting 
information between parties as a JSON object. **This information can be verified and trusted because it is digitally signed.**_

Amazon Cognito User Pools and identity pools can be used in conjunction to provide access to your application. 
An Amazon Cognito User Pools user authenticated with a user name and password can send a JWT to an associated identity pool. 
In turn, the identity pool sends temporary AWS credentials back to the application to access other AWS services. 
There’s no difference with the authentication flow mentioned above for other IdPs.

To use a metaphor, Amazon Cognito User Pools provided you with a passport (JWT) that you can use at the airport counter
to retrieve a boarding pass (access credentials) from an identity pool. With your valid boarding pass, you are then allowed 
to go to the airport gate and board your flight to the AWS Cloud, which is a fitting analogy for this post. 
The boarding pass is only valid for a specific time. In application terms, the token (passport) authenticates the user 
and the issued temporary credentials (boarding pass) authorize the access to connect (board).

## Resources
- [AWS Cognito](https://docs.aws.amazon.com/cognito/latest/developerguide/what-is-amazon-cognito.html)
- [Authentication Flow](https://docs.aws.amazon.com/cognito/latest/developerguide/authentication-flow.html)
- [Secure API Access with Amazon Cognito Federated Identities, Amazon Cognito User Pools, and Amazon API Gateway](https://aws.amazon.com/blogs/compute/secure-api-access-with-amazon-cognito-federated-identities-amazon-cognito-user-pools-and-amazon-api-gateway/)
- [Github - aws-cognito-apigw-angular-auth](https://github.com/aws-samples/aws-cognito-apigw-angular-auth)
- [Integrate an API with a User Pool](https://docs.aws.amazon.com/apigateway/latest/developerguide/apigateway-enable-cognito-user-pool.html)
- [x-amazon-apigateway-authorizer Object](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-authorizer.html)
- [x-amazon-apigateway-authtype Property](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-swagger-extensions-authtype.html)
- [REST API ReferenceResourcesAuthorizer](https://docs.aws.amazon.com/apigateway/api-reference/resource/authorizer/#authType)
- [Using Tokens with User Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/amazon-cognito-user-pools-using-tokens-with-identity-providers.html)
- [Github - amplify-js](https://github.com/aws-amplify/amplify-js)
- [](https://docs.aws.amazon.com/AmazonS3/latest/dev/using-aws-amplify.html)