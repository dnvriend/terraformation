.PHONY: help create update delete deploy

environment = "dnvriend/dev"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create: ## create env
	sceptre launch-env $(environment)

delete: ## delete env
	sceptre delete-env $(environment)

info: ## describe resources
	sceptre describe-env-resources $(environment)

deploy: delete create info ## deploy all resources
