.PHONY: help init clean validate mock create delete info deploy
.DEFAULT_GOAL := run

environment = "dnvriend/dev/eu-west-1"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## init python
	@pipenv install --python 2.7.15 --dev

clean: ## clean
	@pipenv --rm

create: ## create env
	@sceptre launch-env $(environment)

delete: ## delete env
	@sceptre delete-env $(environment)

info: ## describe resources
	@sceptre describe-env-resources $(environment)
	@sceptre describe-stack-outputs $(environment) api

deploy: delete create info ## delete and create

endpoint: ## shows the service endpoint
	sceptre describe-stack-outputs dnvriend/dev/eu-west-1 api

merge-lambda: ## merge lambda in api gateway
	aws-cfn-update \
		lambda-inline-code \
		--resource PythonFunction \
		--file lambdas/python_function.py \
		templates/lambda.yaml

	aws-cfn-update \
		lambda-inline-code \
		--resource NodeFunction \
		--file lambdas/node_function.js \
		templates/lambda.yaml
