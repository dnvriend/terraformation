from troposphere import Ref, Template
import troposphere.s3 as s3

def create_bucket() -> s3.Bucket:
    bucket = s3.Bucket("mybucket")
    bucket.BucketName = "dnvriend-foobar-bucket"
    return bucket

def sceptre_handler(sceptre_user_data):
    t = Template()
    t.add_resource(create_bucket())
    return t.to_json()