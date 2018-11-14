#!/bin/bash
CLUSTER_ARN=$(aws cloudformation describe-stacks --stack-name ecr-dnvriend-dev-eu-west-1-ecs --query "Stacks[0].Outputs[?OutputKey=='ClusterArn'] | [0].OutputValue" --output text)
pipenv run python get_eip_public_ip.py --cluster-id ${CLUSTER_ARN}
