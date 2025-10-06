# Workshop Infra Kubernetes

This repository contains the infrastructure as code to deploy a Kubernetes cluster on AWS with an observability stack 
and Contrast Security Agent Operator. This setup is used for workshops and demos, where each workshop user will have
their own namespace and access to an application for testing with Contrast. 

## Prerequisites
- [AWS CLI](https://aws.amazon.com/cli/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/intro/install/)
- Admin level AWS role configured to login with `aws sso login`

## Deployment Steps
```shell
# Create the cluster
cd 1-cluster
make create-cluster

# Install the ingress controller
cd ../
make deploy-nginx

# Setup DNS rules (already setup for 'workshop-cluster')
# make configure-dns

# Complete the rest of the deployment
# Install the observability stack and contrast
make setup-kube

```
