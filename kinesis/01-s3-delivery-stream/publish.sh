#!/bin/bash
#ARN=`sceptre --output json describe-stack-outputs example kinesis | jq -r '.[] | select(.OutputKey | . and contains("KinesisStreamArn")) | .OutputValue'`
NAME=`sceptre --output json describe-stack-outputs example kinesis | jq -r '.[] | select(.OutputKey | . and contains("KinesisStreamName")) | .OutputValue'`
BUCKET_NAME=`sceptre --output json describe-stack-outputs example kinesis | jq -r '.[] | select(.OutputKey | . and contains("BucketName")) | .OutputValue'`

echo "BucketName=$BUCKET_NAME"

function publish {
    aws firehose put-record --delivery-stream-name $NAME --record 'Data="{\"foo\":\"bar\"}"'
}

for i in {1..10}; do publish; done


