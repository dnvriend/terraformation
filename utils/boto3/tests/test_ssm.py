import boto3

session = boto3.Session(region_name='eu-west-1')
ssm = session.client('ssm')

# AWS  Systems  Manager  is  a  collection of capabilities that helps you
# automate management tasks such as collecting system inventory, applying
# operating  system  (OS)  patches,  automating  the  creation  of Amazon
# Machine Images (AMIs), and  configuring  operating  systems  (OSs)  and
# applications  at  scale.

# An interesting capability is the 'parameter-store' where key/value can be
# stored and returned by means of an API call

def test_ssm_get_parameter() -> None:
    assert ssm.get_parameter(Name='FIRST_NAME')['Parameter']['Value'] == 'dennis'
    assert ssm.get_parameter(Name='SURNAME')['Parameter']['Value'] == 'vriend'
    assert ssm.get_parameter(Name='SECRET', WithDecryption=True)['Parameter']['Value'] == 'secret'

def name():
    return 'dennis'

def test_misc():
    assert f'{name()}' == 'dennis'