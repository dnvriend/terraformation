import boto3


def test_crud():
    client = boto3.client('dynamodb')

    client.put_item(
        TableName='Names',
        Item={
            'Name': {'S': 'Dennis Vriend'},
            'Age': {'N': '42'}
        }
    )

    result = client.get_item(
        TableName='Names',
        Key={
            'Name': {'S': 'Dennis Vriend'}
        }
    )
    assert result['Item']['Name']['S'] == 'Dennis Vriend'
    assert result['Item']['Age']['N'] == '42'

    client.delete_item(
        TableName='Names',
        Key={
            'Name': {'S': 'Dennis Vriend'}
        }
    )

    res = client.get_item(
        TableName='Names',
        Key={
            'Name': {'S': 'Dennis Vriend'}
        }
    )

    assert not res.get('Item')