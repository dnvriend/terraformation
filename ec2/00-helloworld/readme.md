## 00-helloworld
A public vpc, with a single t3.micro running httpd with a static web page available on port 80.

## T3 Instances?
Yes, [from August 21, 2018](https://aws.amazon.com/about-aws/whats-new/2018/08/introducing-amazon-ec2-t3-instances/), 
Amazon Web Services (AWS) is introduced the next generation EC2 burstable general-purpose instances. The T3 instance
performs 30% better according to AWS. These new Xeon Scalable processors feature new AVX-512 instructions that can further 
accelerate performance. T3 instances also support Enhanced Networking with up to 5 Gbps in network bandwidth using the 
Amazon Elastic Network Adaptor.

## How to use
Type:

- make create
- make delete
- make deploy
- make info


