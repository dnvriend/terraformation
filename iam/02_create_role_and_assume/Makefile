.PHONY: help init rm
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## initializes a virtual python environment
	pipenv install --three --dev

rm: ## remove a virtual python virtual environment
	pipenv --rm

shell: ## enter the python environment
	pipenv shell

deploy: ## deploy
	pipenv run sceptre launch create-role -y

# pipenv run ./assume_role.py -a $(ACCOUNT_ID) -r AllowS3AccessRole -s foobar

delete: ## delete
	pipenv run sceptre delete create-role -y

