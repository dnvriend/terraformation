# CloudFront
[AWS CloudFront](https://aws.amazon.com/cloudfront/) is a global content delivery network (CDN) service that securely 
delivers data, videos, applications, and APIs to your viewers with low latency and high transfer speeds. CloudFront is 
integrated with AWS – including physical locations that are directly connected to the AWS global infrastructure, 
as well as software that works seamlessly with services including AWS Shield for DDoS mitigation, Amazon S3, 
Elastic Load Balancing or Amazon EC2 as origins for your applications, and Lambda@Edge to run custom code close 
to your viewers.

## Temporary Redirect
If you're using Amazon S3 as the origin for a CloudFront distribution and you move the bucket to a different region, 
CloudFront can take up to an hour to update its records to include the change of region when both of the following are true:

- You're using a CloudFront origin access identity (OAI) to restrict access to the bucket
- You move the bucket to an Amazon S3 region that requires Signature Version 4 for authentication

Speed up: Maybe host your CloudFront and S3 Buckets from us-east-1

## Resources
- [AWS CloudFront](https://aws.amazon.com/cloudfront/)
- [AWS CloudFront Redirect to S3 Bucket](https://stackoverflow.com/questions/38735306/aws-cloudfront-redirecting-to-s3-bucket)
- [CloudFront Redirecting to S3 Bucket with 307 Temp Redirect](https://stackoverflow.com/questions/46520566/cloudfront-redirecting-to-s3-endpoint-with-307-temporary-redirect)
- [Move S3 Bucket to Different Region](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/DownloadDistS3AndCustomOrigins.html#move-s3-bucket-different-region)
- [Amazon CloudFront Template Snippets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-cloudfront.html)
- [Bucket Access Policy](https://stackoverflow.com/questions/22668121/creating-an-s3-bucket-policy-that-allows-access-to-cloudfront-but-restricts-acce)
- [Granting Permission to an Amazon CloudFront Origin Identity](https://docs.aws.amazon.com/AmazonS3/latest/dev/example-bucket-policies.html#example-bucket-policies-use-case-6)
- [Private Content](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html)
- [Restricting Amazon S3 Bucket Access on CloudFront Distributions](https://blog.shikisoft.com/restrict-amazon-s3-bucket-access-on-cloudfront/)
- [GitHub Example](https://github.com/lroguet/amzn-cloudformation/blob/master/storage-content-delivery/static-website-with-cloudfront.yml)

# What is an Origin Access Identity used for?
The problem with CloudFront distributions with default settings is that you make your bucket public and your users can 
also access your content through Amazon S3 bucket if they know the bucket address. This makes CloudFront’s caching mechanism ineffective. 
Besides, if you would like to serve your private content with signed urls through CloudFront, you need to allow access to 
your content only through CloudFront. Otherwise, unauthorized users can access your content through Amazon S3 without your control.

To avoid this situation, you need to define an `Origin Access Identity` (OAI) for your CloudFront distribution, make your bucket 
private and only grant access to this Origin Access Identity.

However, let me note that OAI is only applicable to distributions who have Amazon S3 buckets as Origin Domain Name. 
Unfortunately, you cannot use an Origin Access Identity on a distribution for a static website hosted on Amazon S3 which should have its 
S3 website address as the origin domain name.

# How to create an Origin Access Identity
An OAI is a special Amazon CloudFront user. You can create an Origin Access Identity while creating your CloudFront distribution:

```yaml
CloudFrontOriginAccessIdentity:
    Type: AWS::CloudFront::CloudFrontOriginAccessIdentity
    Properties:
      CloudFrontOriginAccessIdentityConfig:
        Comment: 'The origin access identity for the CloudFront distribution'
```

Once created, the OAI has no permissions. You need to grant it read access to your S3 bucket to be able to serve your users.
The Arn of an OAI is: ''

```json
{
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "1",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn-of-your-origin-access-identity"
            },
            "Action": "s3:GetObject",
            "Resource": "arn-of-your-bucket/*"
        }
    ]
}
```


```json
{
    "Version": "2008-10-17",
    "Id": "PolicyForCloudFrontPrivateContent",
    "Statement": [
        {
            "Sid": "1",
            "Effect": "Allow",
            "Principal": {
                "CanonicalUser": "amazon-s3-canonical-user-id-of-the-origin-access-identity"
            },
            "Action": "s3:GetObject",
            "Resource": "arn-of-your-bucket/*"
        }
    ]
}
```
