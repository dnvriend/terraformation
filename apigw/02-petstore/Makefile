.PHONY: help create delete info deploy swagger
.DEFAULT_GOAL := deploy

environment = "dnvriend/dev/eu-west-1"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create: ## create env
	pipenv run sceptre launch-env $(environment)

delete: ## delete env
	pipenv run sceptre delete-env $(environment)

info: ## describe resources
	pipenv run sceptre describe-env-resources $(environment)
	pipenv run sceptre describe-stack-outputs $(environment) api

deploy: delete create info ## delete and create

swagger: ## call with make swagger ID=<rest_api_id>
	@aws apigateway get-export --rest-api-id $(ID) --stage-name dev --accepts application/yaml --export-type swagger /tmp/swagger.yaml
	@cat /tmp/swagger.yaml

init: ## init python
	@pipenv install --python 2.7.15 --dev

clean: ## clean
	@pipenv --rm

validate: ## validate swagger
	@pipenv run openapi-spec-validator --schema 2.0 swagger/swagger.yaml
