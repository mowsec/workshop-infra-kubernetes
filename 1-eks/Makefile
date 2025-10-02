
aws-sso-login:
	@echo "Logging in to AWS SSO..."
	aws sso login

eksctl-create-cluster: aws-sso-login
	@echo "Creating EKS Cluster..."
	eksctl create cluster -f workshop-cluster.yaml

create-cluster: eksctl-create-cluster
