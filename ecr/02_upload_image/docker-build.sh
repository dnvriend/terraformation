#!/bin/bash
REG_ID=$(aws cloudformation describe-stacks --stack-name ecr-dnvriend-dev-eu-west-1-ecr --query "Stacks[0].Outputs[?OutputKey=='RegistryName'] | [0].OutputValue" --output text)
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
docker build -t ${REG_ID} .

aws ecr batch-delete-image --repository-name my-repo --image-ids imageTag=latest