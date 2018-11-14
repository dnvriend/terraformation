## 08-cf-apigw-s3-cert
Api Gateway and S3 fronted by a CloudFront distribution, with simple website that does ajax call to Api Gateway,
no CORS headers needed and Route53 domain. SSL setup by means of Amazon Certificate Manager.

## SSL
The certificate requested by AWS must be created in us-east-1, so you end up with an ARN that you must copy/paste 
to the cf.yaml as a dependency.

## CloutFront + SSL
Please don't forget to add an Alias to the Route53 domain, which is `helloworld.dennisvriend.com` in this example.

## CloudFront + Cache
After the CloudFront distribution has finished deploying, note that the first 10 requests or so will be forwarded 
to your S3 bucket domain name. When calling ApiGateway by means of a relative path, this could generate errors because
the s3 bucket domain name does host the ApiGateway at the relative path, but CloudFront does. After the content has been 
distributed, and cached by CloudFront (use curl 10 times), the content will be hosted by CloudFront and there is no
redirect to the s3 bucket. The website will work as expected.

## Usage
First create the us-east-1 certificate, and replace the arn in `config/cf.yaml`. Then launch the environment in eu-west-1.

 
## Resources
- [Using HTTPS with CloudFront](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-https.html#CNAMEsAndHTTPS)
  

