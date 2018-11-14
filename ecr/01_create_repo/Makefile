.PHONY: help create update delete destroy apply plan show

stack_name = "ecr"
template = "templates/ecr.yaml"
environment = "dnvriend/dev/eu-west-1"
stack = "ecr"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

#create:
#	aws cloudformation create-stack --stack-name $(stack_name) --template-body file://$(template)
#	aws cloudformation wait stack-create-complete --stack-name $(stack_name)
#
#update:
#	aws cloudformation update-stack --stack-name $(stack_name) --template-body file://$(template)
#	aws cloudformation wait stack-update-complete --stack-name $(stack_name)
#
#delete:
#	aws cloudformation delete-stack --stack-name $(stack_name)
#	aws cloudformation wait stack-delete-complete --stack-name $(stack_name)
#
#describe:
#	aws cloudformation describe-stacks --stack-name $(stack_name)
#
#events:
#	aws cloudformation describe-stack-events --stack-name $(stack_name)

create: ## create env
	@sceptre launch-stack $(environment) $(stack)

delete: ## delete env
	@sceptre delete-stack $(environment) $(stack)

info: ## info
	@sceptre describe-env-resources $(environment)
	@sceptre describe-stack-outputs $(environment) $(stack)

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
