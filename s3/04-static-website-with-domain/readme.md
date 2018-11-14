## 04-static-website-with-domain
A simple S3 static website

## Urls
The s3 website has its own url eg. `https://s3-static-website-dnvriend-dev-eu-we-deploybucket-zyqzv48p5ap1.s3.amazonaws.com`
which is the url to the bucket itself and has the `.s3.amazonaws.com` name. When the `WebsiteConfiguration` has been configured, the S3 enables the static 
website service, which has a different url `http://s3-static-website-dnvriend-dev-eu-we-deploybucket-zyqzv48p5ap1.s3-website-eu-west-1.amazonaws.com`
which has the `.s3-website-eu-west-1.` name.  Note that you need to use CloudFront if you want an SSL protected website (https).

## Route53


## How to use
Type:

- make create
- make delete
- make info

Have fun!

## Resources
- [Amazon S3 Template Snippets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/quickref-s3.html)
- [AWS Regions and Endpoints](https://docs.aws.amazon.com/general/latest/gr/rande.html)
- [AWS::S3::Bucket](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket.html#aws-properties-bucket-ref)