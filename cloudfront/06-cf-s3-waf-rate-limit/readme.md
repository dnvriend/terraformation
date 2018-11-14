# 06-cf-waf-rate-limit
AWS WAF or `Web Application Firewall` supports Rate Limiting or `Rate-based Rules` how its called. Rate-based Rules is 
a rule type that protects customer websites and APIs from threats such as web-layer DDoS attacks, brute force login 
attempts and bad bots. Rate Based Rules are automatically triggered when web requests from a client exceed a certain 
configurable threshold. 

With Rated-based Rules customers can also block future requests from a client trying to send large volume of requests to 
certain parts of their website like the login page. Customer can also integrate this new rule with CloudWatch Alarms and 
AWS Lambda to take custom action on clients making unusually high calls against their API endpoints. Customers can also 
use Rate-Based Rules to mitigate unwanted bots by combining the Rate-based rule with a condition to identify specific 
malicious user agents’ associated with bad bots.

Getting started with AWS WAF Rate-based rule is easy. Simply create a new rule type called `Rate-based Rule`, enter the 
Rate limit value and add the rule to a WebACL. That’s it. Rate based rules come with all the benefits of other AWS WAF rules 
such as fast rule propagations, very low latency of execution, sample web requests and CloudWatch metrics.

## Integrating WAF to CloudFront
When you create an [AWS::CloudFront::Distribution](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-cloudfront-distribution.html),
you choose an [AWS::WAF::WebACL](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-waf-webacl.html) to 
associate with the distribution. AWS WAF is a web application firewall that enables you to monitor the HTTP and HTTPS requests 
that are forwarded to CloudFront and to control who can access your content. CloudFront permits or forbids requests based on conditions 
that you specify, such as the IP addresses from which requests originate or the values of query strings. 
AWS WAF starts to `allow`, `block`, or `count` web requests for those distributions based on the conditions that 
you identify in the WebACL.

## Creating rules
The [AWS::WAF::Rule](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-waf-rule.html#aws-resource-waf-rule-syntax) resource 
creates an AWS WAF rule that specifies a combination of IPSet, ByteMatchSet, and SqlInjectionMatchSet objects that identify the web requests to 
allow, block, or count. To implement rules, you must associate them with a web ACL.

## Recap
So create a CloudFront distribution, associate the distribution with a WebACL and associate the WebACL with one or more Rules
and you have a managed Web Application Firewall that supports 

## Resources
- [AWS Announces Rate-Based Rules for AWS WAF](https://aws.amazon.com/about-aws/whats-new/2017/06/aws-announces-rate-based-rules-for-aws-waf/)
- [Protect Web Sites & Services Using Rate-Based Rules for AWS WAF](https://aws.amazon.com/blogs/aws/protect-web-sites-services-using-rate-based-rules-for-aws-waf/)
- [How AWS WAF Works with Amazon CloudFront Features](https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html)
- [AWS::WAF::WebACL](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-waf-webacl.html)
- [AWS::WAF::Rule](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-waf-rule.html#aws-resource-waf-rule-syntax)