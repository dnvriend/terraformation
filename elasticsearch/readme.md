# Elasticsearch Service
[Amazon Elasticsearch Service (Amazon ES)](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/what-is-amazon-elasticsearch-service.html) 
is a managed service that makes it easy to deploy, operate, and scale Elasticsearch clusters in the AWS Cloud. Elasticsearch 
is a popular open-source search and analytics engine for use cases such as log analytics, real-time application monitoring, 
and clickstream analysis. With Amazon ES, you get direct access to the Elasticsearch APIs; existing code and applications 
work seamlessly with the service.

## Default Instance Type
m4.large.elasticsearch 
 
## Cluster Limits
Maximum number of data instances: 20
Maximum number of dedicated master nodes: 5
Maximum number of domains per account (per region): 100
Instance types: 
- t2.small.elasticsearch (0.039 p/h or $1 per day - 1cpu/2G)
- t2.medium.elasticsearch 2cpu/4G -> 0.078: $1.8/day
- m4.large.elasticsearch: 2cpu/8G -> 0.167: $4/day
- r4.large.elasticsearch -> 2cpu/15G -> 0.218: $5.2/day
 
## JVM Limits
Amazon ES limits Java processes to a heap size of 32 GB. Advanced users can specify the percentage of the heap used for 
field data. For more information, see Configuring Advanced Options and JVM OutOfMemoryError. 
 
## Resources
- [Pricing](https://aws.amazon.com/elasticsearch-service/pricing/)
- [Amazon Elasticsearch Service Limits](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/aes-limits.html)
- [Features of Amazon Elasticsearch Service](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/what-is-amazon-elasticsearch-service.html)
- [Network limits](https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/aes-limits.html#network-limits)
- [Kibana Cross Cluster Search](https://www.elastic.co/guide/en/kibana/current/management-cross-cluster-search.html)