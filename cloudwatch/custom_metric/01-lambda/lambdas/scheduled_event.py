import json
import botocore.vendored.requests as requests
import boto3
import datetime
from time import gmtime, strftime

client = boto3.client('cloudwatch')

# see: https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/cloudwatch.html#CloudWatch.Client.put_metric_data

def handler(event, context):
    start = datetime.datetime.now()
    response = requests.get('https://www.google.nl')
    end = datetime.datetime.now()
    diff = end - start
    client.put_metric_data(
        Namespace='dnvriend/my-custom-metric', # The namespace for the metric data.
        MetricData=[
            {
                'MetricName': f'google_http_{response.status_code}', # The name of the metric.
                'Timestamp': datetime.datetime.now(), # The time the metric data was received, expressed as the number of milliseconds since Jan
                'Value': diff.microseconds, # The value for the metric.
                'Unit': 'Microseconds',
                'StorageResolution': 1 # Valid values are 1 and 60. Setting this to 1 specifies this metric as a high-resolution metric, so that CloudWatch stores the metric with sub-minute resolution down to one second. Setting this to 60 specifies this metric as a regular-resolution metric, which CloudWatch stores at 1-minute resolution.
            },
        ]
    )
