## 05-basic-cluster

Elasticsearch exposes the following ports: 

- 9200: requests, Restful API with JSON over HTTP
- 9300: cluster communication, native elasticsearch binary transport protocol
- 9600: logstash
- 5601: logstash

https://www.elastic.co/blog/found-interfacing-elasticsearch-picking-client

- Elasticsearch service has mapped port 9200 to port 443 with https
- 


## Cross Cluster Search (ES)
The [Cross Cluster Search](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-cross-cluster-search.html) feature allows any node to act as a federated client across multiple clusters. A cross cluster search node won’t join the remote cluster, instead it connects to a remote cluster in a light fashion in order to execute federated search requests.

Cross-cluster search requires [configuring remote clusters](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-remote-clusters.html).

Note that cross cluster search uses the native elasticsearch binary transport protocol, so port 9300.

## Cross Cluster Search (Kibana)
Starting in [Kibana 6.3](https://www.elastic.co/guide/en/kibana/6.2/management-cross-cluster-search.html), you can specify multiple clusters to search as a comma-separated list using the cluster_one:index_name,cluster_two:index_name notation. 

## AWS Forums:
- ['cross-cluster search' -> No answer yet](https://forums.aws.amazon.com/thread.jspa?threadID=264307)


## Resources
- [Working with Elasticsearch Cross Cluster Search](https://kelonsoftware.com/elasticsearch-cross-cluster-search/)



