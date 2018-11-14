import boto3

boto3.setup_default_session(profile_name='ocp-at')
client = boto3.client('logs')

def delete_log_group(logGroupNamePrefix: str):
    paginator = client.get_paginator('describe_log_groups')
    for page in paginator.paginate(logGroupNamePrefix=logGroupNamePrefix):
        for group in page['logGroups']:
            client.delete_log_group(logGroupName=group['logGroupName'])


def test_delete_lambda_loggroups():
    delete_log_group('describe_log_groups')

def test_delete_api_gateway_execution_logs():
    delete_log_group('API-Gateway-Execution-Logs')