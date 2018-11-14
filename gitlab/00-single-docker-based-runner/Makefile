.PHONY: help create update delete deploy info

environment = "dnvriend/dev/eu-west-1"
stack = "ecr"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create: ## create env
	@sceptre launch-env $(environment)

delete: ## delete env
	@sceptre delete-env $(environment)

deploy: delete create info ## deploy the environment

info: ## info
	@sceptre describe-env-resources $(environment)
	@sceptre describe-stack-outputs $(environment) gitlab



