.PHONY: help init clean test
.DEFAULT_GOAL := help

export PYTHONWARNINGS=ignore::DeprecationWarning

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## init python
	@pipenv install

clean: ## clean
	@pipenv --rm

test: ## run tests
#	@pipenv run pytest -s -v
	@pipenv run pytest -s -v tests/delete_lambda_log_groups.py