from sceptre.hooks import Hook
from sceptre.resolvers.stack_output import StackOutput
import boto3


class S3DeleteBucket(Hook):
    def __init__(self, *args, **kwargs):
        super(S3DeleteBucket, self).__init__(*args, **kwargs)

    def run(self):
        try:
            bucket_name = StackOutput(argument=self.argument,
                                 connection_manager=self.connection_manager,
                                 environment_config=self.environment_config,
                                 stack_config=self.stack_config,
                                 ).resolve()
            s3 = self.connection_manager.boto_session.resource('s3')
            bucket = s3.Bucket(bucket_name)
            print(f"Deleting bucket: {bucket_name}")
            bucket.delete()
        except Exception as e:
            print(e)
