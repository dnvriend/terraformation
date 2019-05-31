# 02_create_role_and_assume

## Notes
The calls to AWS STS AssumeRole must be signed with the access key ID and secret access key of an existing IAM user or by using existing temporary credentials such as those from antoher role. You cannot call AssumeRole with the access key for the root account. The credentials can be in environment variables or in a configuration file and will be discovered automatically by the boto3.client() function.

 