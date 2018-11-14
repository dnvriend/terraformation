.PHONY: help create update delete

stack_name = "dnvriend-s3-bucket-logging"
template = "template.yaml"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create:
	aws cloudformation create-stack --stack-name $(stack_name) --template-body file://$(template)
	aws cloudformation wait stack-create-complete --stack-name $(stack_name)

update:
	aws cloudformation update-stack --stack-name $(stack_name) --template-body file://$(template)
	aws cloudformation wait stack-update-complete --stack-name $(stack_name)

delete:
	aws cloudformation delete-stack --stack-name $(stack_name)
	aws cloudformation wait stack-delete-complete --stack-name $(stack_name)

describe:
	aws cloudformation describe-stacks --stack-name $(stack_name)

events:
	aws cloudformation describe-stack-events --stack-name $(stack_name)

apply:
	terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve

init:
	terraform init

plan:
	terraform plan

show:
	terraform show