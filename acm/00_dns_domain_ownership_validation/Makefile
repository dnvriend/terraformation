.PHONY: help init clean validate mock create delete info deploy
.DEFAULT_GOAL := run

environment = "dnvriend/dev/us-east-1"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create: ## create env
	@sceptre launch-env $(environment)

delete: ## delete env
	@sceptre delete-env $(environment)

info: ## describe resources
	@sceptre describe-env-resources $(environment)

deploy: delete create info ## delete and create

create-certificate: ## create the certificate
	@sceptre launch-env $(environment)

delete-certificate: ## delete the certificate
	@sceptre delete-env $(environment)