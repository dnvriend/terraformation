.PHONY: help create delete info
.DEFAULT_GOAL := create

export GOPATH=/Users/dennis/projects/aws-templates/lambda/04-lambda-golang
#export GOOS=linux go build github.com/dnvriend/aws-lambda-go/main.go
environment = "dnvriend/dev/eu-west-1"
stack = "lambda"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

create: ## create env
	@sceptre launch-stack $(environment) $(stack)

delete: ## delete env
	@sceptre delete-stack $(environment) $(stack)

info: ## info
	@sceptre describe-env-resources $(environment)
	@sceptre describe-stack-outputs $(environment) $(stack)

invoke: ## describe resources
	@aws lambda invoke --function-name PythonFunction out.txt
	@cat out.txt
	@rm out.txt

init:
	go get github.com/aws/aws-lambda-go/lambda

build:
	go build src/github.com/dnvriend/aws-lambda-go/main.go