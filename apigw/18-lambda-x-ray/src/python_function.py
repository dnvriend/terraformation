import json
import boto3
import uuid
import botocore
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch_all

patch_all()

dynamo = boto3.client('dynamodb')
xray = boto3.client('xray')

# @xray_recorder.capture('generate_id')
def generate_id() -> str:
    with xray_recorder.capture('generate_id') as subsegment:
        id = uuid.uuid4()
        id_as_str = str(id)
        subsegment.put_annotation('generated_id', id_as_str)
        return id_as_str

# @xray_recorder.capture('insert_record_to_table')
def insert_to_table():
    with xray_recorder.capture('insert_record_to_table') as subsegment:
        id = generate_id()
        subsegment.put_annotation('received_id', id)
        dynamo.put_item(
            TableName='heroes',
            Item={
                'id': {
                    'S': id
                }
            })

def handler(event, context):
    with xray_recorder.capture('insert_record_to_table') as subsegment:
        insert_to_table()
        response = {
            'statusCode': 200,
            'body': json.dumps('Hello Python')
        }
        raise ValueError("Just an error")
        return response