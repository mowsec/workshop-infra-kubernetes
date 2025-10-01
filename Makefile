.SILENT:

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# Set the TLD for DNS resolution in Kubernetes, or set to localhost for local docker
# TLD=localhost
TLD=workshop.contrastdemo.com


download-helm-dependencies:
	@echo "Downloading Helm chart dependencies..."
	@cd 3-observability-stack && helm dependency update
	@cd 4-contrast-agent-operator && helm dependency update
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
	helm upgrade --install contrast-agent-operator ./4-contrast-agent-operator --cleanup-on-fail 
	@echo "\nSetting Contrast Agent Operator Token..."
	kubectl -n contrast-agent-operator delete secret default-agent-connection-secret --ignore-not-found
	kubectl -n contrast-agent-operator create secret generic default-agent-connection-secret --from-literal=token=$(CONTRAST__AGENT__TOKEN)
	echo ""

deploy-nginx:
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
	--namespace kube-system --create-namespace -f 2-nginx-ingress/values-nginx.yaml

deploy-observability-stack: download-helm-dependencies
	@echo "\nDeploying Observability Stack..."
	@echo "\nSetting up FluentBit and Falco..."
	helm upgrade --install observability-stack ./3-observability-stack --cleanup-on-fail \
		--namespace observability --create-namespace
	@echo ""
	@echo "\nSetting up OpenSearch..."
	sleep 10
	kubectl apply -f ingress.yaml -n observability
	@until curl --insecure -s -o /dev/null -w "%{http_code}" http://opensearch.$(TLD)/ | grep -q "302"; do \
        echo "Waiting for OpenSearch..."; \
        sleep 5; \
    done

	curl --insecure  -X POST -H "Content-Type: multipart/form-data" -H "osd-xsrf: osd-fetch" "http://opensearch.$(TLD)/api/saved_objects/_import?overwrite=true" -u admin:Contrast@123! --form file='@opesearch_savedobjects.ndjson'
	curl --insecure  -X POST -H 'Content-Type: application/json' -H 'osd-xsrf: osd-fetch' "http://opensearch.$(TLD)/api/opensearch-dashboards/settings" -u admin:Contrast@123! --data-raw '{"changes":{"defaultRoute":"/app/dashboards#/"}}'
	sleep 5;
	echo "OpenSearch setup complete."

setup-kube: deploy-observability-stack deploy-contrast
	@echo "\nSetting up Cluster monitoring and Contrast Agent Operator..."


print-deployment:
	echo "\n\nInfrastructure deployment complete!"
	echo "=================================================================="
	echo "Note: It may take a few minutes for the deployment to be fully ready."
	echo "==================================================================\n"
	echo ""
	echo " - Contrast Agent Operator deployed to namespace: contrast-agent-operator"
	echo " - FluentBit deployed to namespace: observability"
	echo " - Falco deployed to namespace: observability"
	echo " - OpenSearch deployed to namespace: observability"
	echo ""
	echo "OpenSearch Dashboard: http://opensearch.$(TLD)"
	echo "  Username: admin"
	echo "  Password: Contrast@123!"
	echo ""

uninstall:
	@echo "\nUninstalling Contrast Agent Operator and related components..."
	helm uninstall contrast-agent-operator
	kubectl delete namespace contrast-agent-operator --ignore-not-found
	helm uninstall observability-stack -n observability
	kubectl delete namespace observability --ignore-not-found
	@echo "Uninstallation complete."
