#!/usr/bin/env python
import click
import boto3
import logging
from dataclasses import dataclass
from datetime import datetime
import json

@dataclass(frozen=True)
class SNSMessageId:
    value: str

def publish(client, topic_name: str, message: str) -> SNSMessageId:
    logging.info(f'publishing: {message}')
    resp = client.publish(
        TopicArn=f'arn:aws:sns:eu-west-1:612483924670:{topic_name}',
        Subject=f'Message={message}',
        Message='{}'
    )
    return SNSMessageId(resp['MessageId'])

@click.command()
@click.option('-t', '--topic-name', required=True, type=str, help="topic name")
@click.option('-m', '--message', required=True, type=str, help="message to publish")
def main(topic_name: str, message: str) -> None:
    """publish a message to SNS"""
    logging.basicConfig(level=logging.INFO, format='%(asctime)s:%(name)s:%(levelname)s:%(message)s')
    logging.info(f'publishing {message} to topic={topic_name}')
    client = boto3.client('sns')
    id = publish(client, topic_name, message + str(datetime.utcnow()))
    logging.info(id)


if __name__ == '__main__':
    main()