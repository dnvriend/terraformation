.PHONY: help create update delete

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## initialize the virtual env
	pipenv install --three --pre

generate: ## generate the template
	pipenv run sceptre generate bucket

create: ## create
	pipenv run sceptre launch bucket -y

delete: ## delete
	pipenv run sceptre delete bucket -y