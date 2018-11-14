# 03-cloudwatch-logsubscription


## Data ingestion using Amazon CloudWatch Logs
Amazon CloudWatch Logs lets you monitor and troubleshoot your systems and applications using your existing system, 
application, and custom log files. You can configure a CloudWatch Logs log group to stream data to your 
Amazon Elasticsearch Service domain in near real-time through a [CloudWatch Logs subscription](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_ES_Stream.html). 
This integration is convenient if you are already using CloudWatch Logs to collect log data, and would like to share that data with 
your Amazon Elasticsearch Service users. If you are already collecting application logs using Amazon CloudWatch Logs, 
you can simply load that data into your Amazon Elasticsearch Service domain without much additional effort.

## CloudWatch Logs subscription
You can use subscriptions to get access to a real-time feed of log events from CloudWatch Logs and have it delivered to 
other services such as an Amazon Kinesis stream, Amazon Kinesis Data Firehose stream, or AWS Lambda for custom processing, 
analysis, or loading to other systems. To begin subscribing to log events, create the receiving source, such as a Kinesis stream, 
where the events will be delivered. A subscription filter defines the filter pattern to use for filtering which log events get 
delivered to your AWS resource, as well as information about where to send matching log events to.

## Resources
- [Streaming CloudWatch Logs Data to Amazon Elasticsearch Service](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_ES_Stream.html)
- [Real-time Processing of Log Data with Subscriptions](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions.html)
- [Filter and Pattern Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html)
- [Loading Streaming Data into Amazon ES from Amazon S3](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/es-aws-integrations.html)
- [CloudWatch Logs Subscription Consumer + Elasticsearch + Kibana Dashboards](https://aws.amazon.com/blogs/aws/cloudwatch-logs-subscription-consumer-elasticsearch-kibana-dashboards/)
- [Store and Monitor OS & Application Log Files with Amazon CloudWatch](https://aws.amazon.com/blogs/aws/cloudwatch-log-service/)
- [Central Logging in Multi-Account Environments](https://aws.amazon.com/blogs/architecture/central-logging-in-multi-account-environments/)
- [How to analyze AWS WAF logs using Amazon Elasticsearch Service](https://aws.amazon.com/blogs/security/how-to-analyze-aws-waf-logs-using-amazon-elasticsearch-service/)
- [Using AWS CloudWatch Logs and AWS ElasticSearch for log aggregation and visualization](https://medium.com/@griggheo/using-aws-cloudwatch-logs-and-aws-elasticsearch-for-log-aggregation-and-visualization-afb9999f8b3f)
- [cloudwatch-logs-subscription-consumer](https://github.com/amazon-archives/cloudwatch-logs-subscription-consumer/blob/master/configuration/cloudformation/cwl-elasticsearch.template)