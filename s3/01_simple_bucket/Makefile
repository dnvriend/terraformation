.PHONY: help create update delete

stack_name = "dnvriend-s3-bucket"
template = "templates/bucket.yaml"
environment = "dnvriend/dev/eu-west-1"
stack = "bucket"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

sceptre-create: ## create env
	sceptre create-stack $(environment) $(stack)

sceptre-delete: ## delete env
	sceptre delete-stack $(environment) $(stack)

sceptre-info: ## describe resources
	sceptre describe-stack-resources $(environment) $(stack)

create: ## create using CF
	aws cloudformation create-stack --stack-name $(stack_name) --template-body file://$(template)
	aws cloudformation wait stack-create-complete --stack-name $(stack_name)

update: ## update using CF
	aws cloudformation update-stack --stack-name $(stack_name) --template-body file://$(template)
	aws cloudformation wait stack-update-complete --stack-name $(stack_name)

delete: ## delete using CF
	aws cloudformation delete-stack --stack-name $(stack_name)
	aws cloudformation wait stack-delete-complete --stack-name $(stack_name)

describe: ## describe using CF
	aws cloudformation describe-stacks --stack-name $(stack_name)

events: ## get stack events using CF
	aws cloudformation describe-stack-events --stack-name $(stack_name)

apply: ## apply using TF
	terraform apply -auto-approve

destroy: ## destroy using TF
	terraform destroy -auto-approve

init: ## initialize TF project
	terraform init

plan: ## plan using TF
	terraform plan

show: ## show using TF
	terraform show