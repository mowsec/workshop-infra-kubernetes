.SILENT:

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

download-helm-dependencies:
	@echo "Downloading Helm chart dependencies..."
	@cd 5-contrast-agent-operator && helm dependency update
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
	helm upgrade --install contrast-agent-operator ./6-contrast-agent-operator --cleanup-on-fail 
	@echo "\nSetting Contrast Agent Operator Token..."
	kubectl -n contrast-agent-operator delete secret default-agent-connection-secret --ignore-not-found
	kubectl -n contrast-agent-operator create secret generic default-agent-connection-secret --from-literal=token=$(CONTRAST__AGENT__TOKEN)
	echo ""

deploy-nginx:
# 	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	cd 2-nginx-ingress
	helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
	--namespace kube-system --create-namespace -f 2-nginx-ingress/values-nginx.yaml

deploy-fluentbit:
	helm repo add fluent https://fluent.github.io/helm-charts
	helm upgrade --install fluent-bit fluent/fluent-bit \
	-n observability -f 3-fluentbit/values-fluentbit.yaml

deploy-falco:
	helm repo add falco https://falcosecurity.github.io/charts
	helm upgrade --install falco falco/falco \
	-n observability -f 4-falco/values-falco.yaml

install-opensearch:
	kubectl apply -f 5-opensearch -n observability
	echo "\nSetting up OpenSearch"
	sleep 10
	@until curl --insecure -s -o /dev/null -w "%{http_code}" http://opensearch.workshop.contrastdemo.com/ | grep -q "302"; do \
        echo "Waiting for OpenSearch..."; \
        sleep 5; \
    done

	curl --insecure  -X POST -H "Content-Type: multipart/form-data" -H "osd-xsrf: osd-fetch" "http://opensearch.workshop.contrastdemo.com/api/saved_objects/_import?overwrite=true" -u admin:Contrast@123! --form file='@opesearch_savedobjects.ndjson'
	curl --insecure  -X POST -H 'Content-Type: application/json' -H 'osd-xsrf: osd-fetch' 'http://opensearch.workshop.contrastdemo.com/api/opensearch-dashboards/settings' -u admin:Contrast@123! --data-raw '{"changes":{"defaultRoute":"/app/dashboards#/"}}'
	sleep 5;
	echo "OpenSearch setup complete."

create-namespace:
	@echo "\nCreating Kubernetes namespaces..."
	kubectl create namespace observability --dry-run=client -o yaml | kubectl apply -f -
	@echo "Namespaces created successfully."

setup-kube: create-namespace deploy-contrast deploy-nginx deploy-fluentbit install-opensearch
	@echo "\nSetting up Cluster monitoring and Contrast Agent Operator..."

uninstall:
	@echo "\nUninstalling Contrast Agent Operator and related components..."
	helm uninstall contrast-agent-operator
	kubectl delete namespace contrast-agent-operator --ignore-not-found
	helm uninstall ingress-nginx -n observability
	helm uninstall fluent-bit -n observability
	kubectl delete namespace observability --ignore-not-found
	@echo "Uninstallation complete."
