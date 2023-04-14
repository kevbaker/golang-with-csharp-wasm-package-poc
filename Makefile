
# HELP
.DEFAULT_GOAL := help
.PHONY: help
help:
	@echo "\n\n------------------------------------------\Make Command Help\n\n"
	@echo "\nGet more detail on SST here: https://docs.serverless-stack.com/packages/cli\n"
	@echo "\nTARGETS:\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ""

# TARGETS
.PHONY: build
build:	## Build project for deployment
	cd src/dotnet && dotnet build -o ../../dist/dotnet/ && cd -

.PHONY: run-wasm
run-wasm:		## Start dev environment
	wasmer dist/dotnet/FirstDotnetWebAssembly.wasm

.PHONY: run-go
run-go:		## Start dev environment
	cp dist/dotnet/FirstDotnetWebAssembly.wasm src/go/
	cd src/go && go run main.go && cd -

.PHONY: stats
stats:		## Start dev environment
	ls -lah dist/dotnet/*.wasm