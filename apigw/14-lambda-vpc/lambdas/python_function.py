import json
import botocore.vendored.requests as requests


def handler(event, context):
    def response(msg):
        return {
            'statusCode': 200,
            'body': json.dumps(msg)
        }

    x = requests.get('http://10.0.0.189')

    return response(x.text)