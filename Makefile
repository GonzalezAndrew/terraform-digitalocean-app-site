.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

update: ## Gets any module updates
	@terraform get -update=true &>/dev/null

init: update ## Initializes the terraform remote state backend and pulls the correct projects state.
	@terraform init

plan: #init update ## Runs a plan. 
	@terraform plan

show: init ## Shows a module
	@terraform show -module-depth=-1

apply: init update ## Run a apply.
	@terraform apply

output: update ## Show outputs of a module or the entire state.
	@if [ -z $(MODULE) ]; then terraform output ; else terraform output -module=$(MODULE) ; fi

destroy: init update ## Destroys targets
	@terraform destroy

lint: ## Runs lint on all files.
	@pre-commit run -a
