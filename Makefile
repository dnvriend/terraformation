.PHONY: validate validate-cloudformation validate-swagger init

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

validate: validate-cloudformation validate-swagger ## validate cf and swagger

validate-cloudformation: ## validates cloudformation
	./validate_cf.sh

validate-swagger: ## validate swagger
	./validate_swagger.sh

init: ## init python
	pipenv install --three --dev --skip-lock