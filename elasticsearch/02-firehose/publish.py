#!/usr/bin/env python
import boto3
import sys
import json

client = boto3.client('firehose')

stream_name = sys.argv[1]
number_of_messages = int(sys.argv[2])
print(f'Publishing {number_of_messages} to {stream_name}')

records = []

for x in range(1, number_of_messages, 1):
    records.append({
        'Data': bytes(json.dumps({'message': f'hello world {x}'}), 'utf-8')
    })

try:
    response = client.put_record_batch(
        DeliveryStreamName=stream_name,
        Records=records
    )
    if response['FailedPutCount'] > 0:
        print('Error putting messages')

except Exception as e:
    print(f'Error: {e}')

print('Done')
