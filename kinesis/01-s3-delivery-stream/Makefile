.PHONY: help init clean validate mock create delete info deploy
.DEFAULT_GOAL := help
environment = "example"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## init python
	@pipenv install --three --dev

remove: ## clean
	@pipenv --rm

test: ## validate swagger
	@PYTHONWARNINGS="ignore::DeprecationWarning:boto3" pipenv run pytest -s

create: ## create env
	@sceptre launch-env $(environment)

delete: ## delete env
	@sceptre delete-env $(environment)

deploy: delete create info ## delete and create

merge-lambda: ## Merge lambda
	aws-cfn-update \
		lambda-inline-code \
		--resource ProcessorFunction \
		--file lambdas/identity_processor.py \
		templates/kinesis.yaml

publish: ## publish a message to kinesis
	echo ''

get_arn:
	echo ''
