.PHONY: help create update delete

environment = "dnvriend/dev/eu-west-1"
stack = "cw-events"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create: ## create env
	sceptre create-stack $(environment) $(stack)

delete: ## delete env
	sceptre delete-stack $(environment) $(stack)

info: ## describe resources
	sceptre describe-stack-resources $(environment) $(stack)
