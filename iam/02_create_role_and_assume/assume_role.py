#!/usr/bin/env python
import click
import boto3
import logging
from typing import Optional, List
from boto3.session import Session
from botocore.exceptions import ClientError
from botocore.client import BaseClient
from dataclasses import dataclass
from datetime import datetime as DateTime

@dataclass(frozen=True)
class TemporaryCredentials:
    aws_access_key_id: str
    aws_secret_access_key: str
    aws_session_token: str
    expiration: DateTime

@dataclass(frozen=True)
class Bucket:
    name: str
    creation_date: DateTime

@dataclass(frozen=True)
class S3Client:
    client: BaseClient

    def list_buckets(self) -> List[Bucket]:
        resp = self.client.list_buckets()
        return list(map(lambda e: Bucket(e['Name'], e['CreationDate']), resp['Buckets']))

def get_credentials_for_role(aws_account: str, role_name: str, role_session_name: str, duration: int) -> Optional[TemporaryCredentials]:
    creds: Optional[TemporaryCredentials] = None
    sts = boto3.client('sts')
    try:
        resp = sts.assume_role(RoleArn=f'arn:aws:iam::{aws_account}:role/{role_name}', RoleSessionName=role_session_name, DurationSeconds=duration)['Credentials']        
        return TemporaryCredentials(
            resp['AccessKeyId'],
            resp['SecretAccessKey'],
            resp['SessionToken'],
            resp['Expiration']
        )
    except ClientError as e:
        logging.exception('ERROR: %s\n' % e.response['Error']['Message'])

    return creds   

def create_session(creds: TemporaryCredentials) -> Session:
    return Session(
        aws_access_key_id=creds.aws_access_key_id,
        aws_secret_access_key=creds.aws_secret_access_key,
        aws_session_token=creds.aws_session_token
    )

def s3_client(session: Session) -> S3Client:
    return S3Client(session.client('s3'))

@click.command()
@click.option('-a', '--aws-account', required=True, type=str, help="the account id")
@click.option('-r', '--role-name', required=True, type=str, help="The role name to assume")
@click.option('-s', '--session-name', required=True, type=str, help="The name of the session")
@click.option('-d', '--duration', required=False, type=int, help="The duration in seconds of the session", default=3600)
def main(aws_account: str, role_name: str, session_name: str, duration: int) -> None:
    """Assume a role and print the temporary credentials"""
    logging.basicConfig(level=logging.INFO, format='%(asctime)s:%(name)s:%(levelname)s:%(message)s')
    logging.info(f'Assuming role_name={role_name} for aws_account={aws_account}, session_name={session_name}, duration={duration}')
    creds = get_credentials_for_role(aws_account, role_name, session_name, duration)
    session = create_session(creds)
    buckets = s3_client(session).list_buckets()
    for bucket in buckets:
        logging.info(bucket.name)

if __name__ == '__main__':
    main()