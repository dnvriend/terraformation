# 01_create_repo
Create an [AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html) 
[repository](https://docs.aws.amazon.com/codecommit/latest/userguide/repositories.html) and 
[trigger](https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-notify.html)

## AWS CodeCommit
[AWS CodeCommit](https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html) is a version control service 
hosted by Amazon Web Services that you can use to privately store and manage assets (such as documents, source code, 
and binary files) in the cloud. 

## AWS CodeCommit Repository
- [source](https://docs.aws.amazon.com/codecommit/latest/userguide/repositories.html)

A repository is the fundamental version control object in AWS CodeCommit. It's where you securely store code and files 
for your project. It also stores your project history, from the first commit through the latest changes. You can share 
your repository with other users so you can work together on a project.

## AWS CodeCommit Trigger
- [source](https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-notify.html)

You can configure an AWS CodeCommit repository so that code pushes or other events trigger actions, such as sending a notification 
from Amazon Simple Notification Service (Amazon SNS) or invoking a function in AWS Lambda. You can create up to ten triggers for 
each AWS CodeCommit repository.

## Terraform
- [Terraform CodeCommit Repository](https://www.terraform.io/docs/providers/aws/r/codecommit_repository.html)
- [Terraform CodeCommit Trigger](https://www.terraform.io/docs/providers/aws/r/codecommit_trigger.html)
- [Terraform SNS topic](https://www.terraform.io/docs/providers/aws/r/sns_topic.html)

## CloudFormation
- [CloudFormation CodeCommit Repository](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-codecommit-repository.html)