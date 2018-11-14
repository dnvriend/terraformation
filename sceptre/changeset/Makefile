.PHONY: help create delete info
.DEFAULT_GOAL := create

environment = "dnvriend/eu-west-1"
stack = "serverless"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## init python
	@pipenv install --three --dev

remove: ## clean
	@pipenv --rm

test: ## validate swagger
	@PYTHONWARNINGS="ignore::DeprecationWarning:boto3" pipenv run pytest -s

create: ## create env
	sceptre create-stack $(environment) $(stack)
	sceptre create-change-set $(environment) $(stack) changesetname
	sceptre describe-change-set $(environment) $(stack) changesetname
	sceptre execute-change-set $(environment) $(stack) changesetname

delete: ## delete env
	@sceptre delete-stack $(environment) $(stack)

info: ## info
	@sceptre describe-env-resources $(environment)
	@sceptre describe-stack-outputs $(environment) $(stack)
