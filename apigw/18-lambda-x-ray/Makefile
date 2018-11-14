.PHONY: help init clean validate mock create delete info deploy dist copy
.DEFAULT_GOAL := run

environment = "dnvriend/dev/eu-west-1"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## init python
	@pipenv install --three --dev

clean: ## clean
	@pipenv --rm

dist: ## create a zip lambda distribution
	docker build -t my-lambda .

copy: ## copy lambda.zip to host
	./copy_from_docker.sh

create: ## create env
	@sceptre launch-env $(environment)

delete: ## delete env
	@sceptre delete-env $(environment)

info: ## describe resources
	@sceptre describe-env-resources $(environment)
	@sceptre describe-stack-outputs $(environment) api

deploy: delete create info ## delete and create
