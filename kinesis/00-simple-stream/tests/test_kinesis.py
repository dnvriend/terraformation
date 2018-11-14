import boto3
import base64
import json
import uuid


def test_put_record():
    client = boto3.client('kinesis')
    user: dict = {'id': str(uuid.uuid4()), 'name': 'Dennis', 'age': 42}
    result = client.put_record(StreamName='simple-stream', Data=json.dumps(user), PartitionKey='id')
    assert result['ShardId'] == 'shardId-000000000000'
    assert result['SequenceNumber']
    assert result['EncryptionType'] == "KMS"
    assert result['ResponseMetadata']


def test_get_shard_interator():
    # shard iterator type: 'AT_SEQUENCE_NUMBER' | 'AFTER_SEQUENCE_NUMBER' | 'TRIM_HORIZON' | 'LATEST' | 'AT_TIMESTAMP',
    client = boto3.client('kinesis')
    shard_iterator = client.get_shard_iterator(StreamName='simple-stream', ShardId='shardId-000000000000', ShardIteratorType='TRIM_HORIZON')['ShardIterator']
    records = client.get_records(ShardIterator=shard_iterator, Limit=50)
    for record in records['Records']:
        print(record)

