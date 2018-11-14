# 00_dns_domain_ownership_validation
A template to create and validate a certificate using the Amazon Certificate Manager. The example shows 
issuing a `wildcard` certificate for the domain apex `dennisvriend.com` and uses the custom resource provided 
by [binx.io](https://binx.io/) the [cfn-certificate-provider](https://github.com/binxio/cfn-certificate-provider) and
uses DNS validation.
 
## Resources
- [Use DNS to Validate Domain Ownership](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-validate-dns.html)
- [CloudFormation - Create and Verify ACM Certificate using DNS](https://www.reddit.com/r/aws/comments/8g1vhq/cloudformation_create_and_verify_acm_certificate/)  

