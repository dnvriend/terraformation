#!/bin/bash
REG_ID=$(aws cloudformation describe-stacks --stack-name ecr-dnvriend-dev-eu-west-1-ecr --query "Stacks[0].Outputs[?OutputKey=='RegistryName'] | [0].OutputValue" --output text)
aws ecr batch-delete-image --repository-name ${REG_ID} --image-ids imageTag=latest