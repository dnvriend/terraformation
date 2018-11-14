.PHONY: help create update delete

environment = "dnvriend/dev/eu-west-1"
stack = "ecr"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create: ## create env
	@sceptre launch-env $(environment)

delete: ## delete env
	@sceptre delete-env $(environment)

info: ## info
	@sceptre describe-env-resources $(environment)
	@sceptre describe-stack-outputs $(environment) ecs
	@sceptre describe-stack-outputs $(environment) task
	@sceptre describe-stack-outputs $(environment) ecr
	@sceptre describe-stack-outputs $(environment) vpc

docker-login:
	$(aws ecr get-login --no-include-email --region eu-west-1)

docker-build: ## build docker image
	./docker-build.sh

docker-run: ## run container
	./docker-run.sh

docker-tag: ## tag docker image
	./docker-tag.sh

docker-push: docker-build docker-tag ## push image to registry
	./docker-push.sh

get_ip: ## get the public ip
	@./get_ip.sh

