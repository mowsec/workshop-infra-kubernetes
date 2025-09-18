.SILENT:

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

download-helm-dependencies:
	@echo "Downloading Helm chart dependencies..."
	@cd contrast-agent-operator && helm dependency update
	@echo "Helm chart dependencies downloaded successfully."

validate-env-vars:
	@echo "Validating environment variables..."
	@if [ -z "$(CONTRAST__AGENT__TOKEN)" ]; then \
		echo "Error: CONTRAST__AGENT__TOKEN is not set in .env file"; \
		exit 1; \
	fi
	@if [ -z "$(CONTRAST__UNIQ__NAME)" ]; then \
		echo "Error: CONTRAST__UNIQ__NAME is not set in .env file"; \
		exit 1; \
	fi
	@if [ -z "$(CONTRAST__API__KEY)" ]; then \
		echo "Warning: CONTRAST__API__KEY is not set in .env file (optional for ADR data fetching and delete functionality)"; \
	fi
	@if [ -z "$(CONTRAST__API__AUTHORIZATION)" ]; then \
		echo "Warning: CONTRAST__API__AUTHORIZATION is not set in .env file (optional for ADR data fetching and delete functionality)"; \
	fi
	@echo "Required environment variables are set."

deploy-contrast: download-helm-dependencies validate-env-vars
	@echo "\nDeploying Contrast Agent Operator..."
	helm upgrade --install contrast-agent-operator ./contrast-agent-operator --cleanup-on-fail 
	@echo "\nSetting Contrast Agent Operator Token..."
	kubectl -n contrast-agent-operator delete secret default-agent-connection-secret --ignore-not-found
	kubectl -n contrast-agent-operator create secret generic default-agent-connection-secret --from-literal=token=$(CONTRAST__AGENT__TOKEN)
	echo ""

# DO NOT USE
# prepare-infrastructure:
# 	@echo "\nPreparing infrastructure..."
# 	helm upgrade --install infrastructure ./infrastructure --cleanup-on-fail
# 	@echo "\nInfrastructure deployment complete! You can now deploy the application using 'make demo-up'."

prepare-infrastructure: download-helm-dependencies
	@echo "\nPreparing infrastructure..."
	@echo "\nInstalling Cluster Wide Components..."

	@echo "\nInstalling Loki Via Helm..."
	helm upgrade --install loki grafana/loki -f grafana/values.yaml

	@echo "\nInstalling Grafana Via Helm..."
	helm upgrade --install grafana grafana/grafana

	@echo "\nInstalling Prometheus Via Helm..."
	helm upgrade --install  prometheus prometheus-community/prometheus --set prometheus-node-exporter.hostRootFsMount.enabled=false

	@echo "\nInfrastructure deployment complete! You can now deploy the application using 'make demo-up'."


setup-kube: deploy-contrast prepare-infrastructure
	@echo "\nSetting up Cluster monitoring and Contrast Agent Operator..."
