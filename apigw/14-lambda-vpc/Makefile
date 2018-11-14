.PHONY: help init clean validate mock create delete info deploy
.DEFAULT_GOAL := run

environment = "dnvriend/dev/eu-west-1"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## init python
	@pipenv install --python 2.7.15 --dev

clean: ## clean
	@pipenv --rm

validate: ## validate swagger
	@pipenv run openapi-spec-validator --schema 2.0 swagger.yaml

mock: ## run the mock server
	@pipenv run connexion run swagger.yaml --mock=all -v --port=8080

create: ## create env
	@sceptre launch-env $(environment)

delete: ## delete env
	@sceptre delete-env $(environment)

delete-api: ## delete env
	@sceptre delete-stack $(environment) api

info: ## describe resources
	@sceptre describe-env-resources $(environment)
	@sceptre describe-stack-outputs $(environment) api

deploy: delete create info ## delete and create

swagger: ## call with make swagger ID=<rest_api_id>
	@aws apigateway get-export --rest-api-id $(ID) --stage-name dev --accepts application/yaml --export-type swagger swagger.yaml
	@cat swagger.yaml

endpoint: ## shows the service endpoint
	sceptre describe-stack-outputs dnvriend/dev/eu-west-1 api

merge-swagger: ## merge swagger in api gateway
	@aws-cfn-update \
		rest-api-body  \
		--resource RestAPI \
		--open-api-specification swagger/swagger.yaml \
		--api-gateway-extensions swagger/aws-extensions.yaml \
		--add-new-version \
		templates/api-gateway.yaml

merge-lambda: ## merge lambda in api gateway
	aws-cfn-update \
		lambda-inline-code \
		--resource PythonFunction \
		--file lambdas/python_function.py \
		templates/api-gateway.yaml


