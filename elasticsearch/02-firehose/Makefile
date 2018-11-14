.PHONY: help init clean validate mock create delete info deploy
.DEFAULT_GOAL := deploy

environment = "dnvriend/dev/eu-west-1"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create: ## create env
	@sceptre launch-env $(environment)

delete: ## delete env
	@sceptre delete-env $(environment)

info: ## describe resources
	@sceptre describe-env-resources $(environment)

deploy: delete create info ## delete and create


merge-lambda: ## merge lambda in api gateway
	aws-cfn-update \
		lambda-inline-code \
		--resource ProcessorFunction \
		--file lambdas/processor/identity_processor.py \
		templates/elasticsearch.yaml

publish: ## publish messages to kinesis firehose
	pipenv run python publish.py s3-static-website-dnvriend-dev-eu-w-Deliverystream-DK3JBDOAH8UQ 500