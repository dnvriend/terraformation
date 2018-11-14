# Cognito Identity Pools
Amazon Cognito identity pools (federated identities) enable you to create unique identities for your users and federate 
them with identity providers. With an identity pool, you can obtain temporary, limited-privilege AWS credentials to access 
other AWS services. Amazon Cognito identity pools support the following identity providers:

- Public providers: Login with Amazon (Identity Pools), Facebook (Identity Pools), Google (Identity Pools).
- Amazon Cognito User Pools
- Open ID Connect Providers (Identity Pools)
- SAML Identity Providers (Identity Pools)
- Developer Authenticated Identities (Identity Pools)

## CLI
```
aws cognito-idp
aws cognito-sync

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
            "IdentityPoolId": "eu-west-1:b45b9729-c269-4ef2-86f1-0df3e40fe92d", 
            "IdentityPoolName": "dnvriend_pool"
        }
    ]
}

$ aws cognito-identity describe-identity-pool --identity-pool-id eu-west-1:b45b9729-c269-4ef2-86f1-0df3e40fe92d
{
    "IdentityPoolId": "eu-west-1:b45b9729-c269-4ef2-86f1-0df3e40fe92d", 
    "AllowUnauthenticatedIdentities": true, 
    "IdentityPoolName": "dnvriend_pool"
}

$ aws cognito-identity get-id --identity-pool-id eu-west-1:b45b9729-c269-4ef2-86f1-0df3e40fe92d
{
    "IdentityId": "eu-west-1:9539224f-5cd4-4923-a426-d6078ef34b7a"
}

$ aws cognito-identity list-identities --identity-pool-id eu-west-1:b45b9729-c269-4ef2-86f1-0df3e40fe92d --max-results 10
{
    "IdentityPoolId": "eu-west-1:b45b9729-c269-4ef2-86f1-0df3e40fe92d", 
    "Identities": [
        {
            "LastModifiedDate": 1538078988.077, 
            "CreationDate": 1538078988.077, 
            "IdentityId": "eu-west-1:9539224f-5cd4-4923-a426-d6078ef34b7a"
        }
    ]
}

$ aws cognito-identity describe-identity --identity-id eu-west-1:9539224f-5cd4-4923-a426-d6078ef34b7a
{
    "LastModifiedDate": 1538078988.077, 
    "CreationDate": 1538078988.077, 
    "IdentityId": "eu-west-1:9539224f-5cd4-4923-a426-d6078ef34b7a"
}

$ aws cognito-identity get-credentials-for-identity --identity-id eu-west-1:9539224f-5cd4-4923-a426-d6078ef34b7a

An error occurred (InvalidIdentityPoolConfigurationException) when calling the GetCredentialsForIdentity operation

$ aws cognito-identity get-open-id-token --identity-id eu-west-1:9539224f-5cd4-4923-a426-d6078ef34b7a
{
    "Token": "eyJraWQiOiJldS13ZXN0LTExIiwidHlwIjoiSldTIiwiYWxnIjoiUlM1MTIifQ.eyJzdWIiOiJldS13ZXN0LTE6OTUzOTIyNGYtNWNkNC00OTIzLWE0MjYtZDYwNzhlZjM0YjdhIiwiYXVkIjoiZXUtd2VzdC0xOmI0NWI5NzI5LWMyNjktNGVmMi04NmYxLTBkZjNlNDBmZTkyZCIsImFtciI6WyJ1bmF1dGhlbnRpY2F0ZWQiXSwiaXNzIjoiaHR0cHM6Ly9jb2duaXRvLWlkZW50aXR5LmFtYXpvbmF3cy5jb20iLCJleHAiOjE1MzgwNzk4ODUsImlhdCI6MTUzODA3OTI4NX0.Y0ZNWYlk4TT2ClFCLsn2AsZ1JxlkWd_2PFQ4Bl3nl_Dfh2F_RQ1GDdsPa2EArmRGjFDa6vvfWbToNYiX4rxD6SYUMbRtoCuRjNaoFbzHTEMeM7qUh4k9GZWKZg8Fv0iqjKNjXN11FYNFlCMSNA4nhneZtRGr8rw9n9vWw6LWGhks3VRVlQnuURFHfC1TAqiY0O4DZ_IRbT7thUUeDBFgH1VVb2zOqcMDlnPO2gSK-0vI8CD_oiz9FmtUrpI7qiZ9eEwi8HDcwAL-xCawmaT1BVIN-cnAnGAYFbJCXTkJcm0eexZNT18Vez-ytQjW22xZobwhf-6V9UyovciX7oI85A", 
    "IdentityId": "eu-west-1:9539224f-5cd4-4923-a426-d6078ef34b7a"
}
```

## Resources
- [AWS Cognito Identity Pools](https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-identity.html)
- [AWS::Cognito::IdentityPool](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-cognito-identitypool.html)
- [AWS::Cognito::AWS::Cognito::IdentityPoolRoleAttachment](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-cognito-identitypoolroleattachment.html)

