
aws-sso-login:
	@echo "Logging in to AWS SSO..."
	aws sso login

eksctl-create-cluster: aws-sso-login
	@echo "Creating EKS Cluster..."
	eksctl create cluster -f workshop-cluster.yaml
	
get-alb-url:
	@echo "Fetching ALB URL..."
	$(eval ALB_URL:=$(shell kubectl get -n observability ingress/workshop-cluster-wide-ingress -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'))
	@echo "\nUse the URL ${ALB_URL} to access the application."

create-cluster: eksctl-create-cluster get-alb-url
