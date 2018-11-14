.PHONY: help init clean
.DEFAULT_GOAL := help

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

deploy: delete create info ## delete and create

merge-lambda: ## merge lambda in api gateway
	aws-cfn-update \
		lambda-inline-code \
		--resource ScheduledEvent \
		--file lambdas/scheduled_event.py \
		templates/scheduled_event.yaml


