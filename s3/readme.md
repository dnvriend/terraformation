# Amazon Simple Storage Service (S3)


## Deleting all buckets in an account

```bash
for i in $(aws s3 ls --profile default | awk '{ print $3 }'); do aws s3 rm --recursive s3://"$i" --profile default; done
for i in $(aws s3 ls --profile default | awk '{ print $3 }'); do aws s3 rb --recursive s3://"$i" --profile default; done
```

## Questions
How to dynamically put a life cycle on the bucket and objects

- aws s3api put-bucket-lifecycle-configuration

## Resources
- [How Do I Create a Lifecycle Policy for an S3 Bucket](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-lifecycle.html)
- [Object Lifecycle Management](https://docs.aws.amazon.com/AmazonS3/latest/dev/object-lifecycle-mgmt.html)