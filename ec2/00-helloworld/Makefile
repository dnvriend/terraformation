.PHONY: help init clean validate create delete info deploy swagger
.DEFAULT_GOAL := init

environment = "dnvriend/dev/eu-west-1"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create: ## create env
	@sceptre launch-env $(environment)

delete: ## delete env
	@sceptre delete-env $(environment)

info: ## describe resources
	@sceptre describe-env-resources $(environment)
	@sceptre describe-stack-outputs $(environment) ec2

deploy: delete create info ## delete and create