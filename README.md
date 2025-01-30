---

# Terraform Project for Multi-Client Deployment

This project automates the deployment of a Kubernetes cluster and the Odoo application for multiple clients, such as Netflix, Meta, and Rockstar.

## Prerequisites
- Terraform
- Minikube
- kubectl

## Deployment Instructions

1. **Start Minikube**:  
   Ensure a Minikube profile is created for your client. Terraform can automatically handle this if configured.
   ```bash
   minikube start
   ```

2. **Apply the Cert-Manager**:  
   Install the cert-manager by applying the YAML configuration.
   ```bash
   kubectl apply -f cert-manager.yaml
   ```

3. **Enable Ingress Addon**:  
   Enable the Ingress addon in Minikube.
   ```bash
   minikube addons enable ingress
   ```

4. **Initialize Terraform**:  
   Initialize Terraform in your project.
   ```bash
   terraform init
   ```

5. **Create a New Workspace for Each Cluster**:  
   Create a workspace for each new client cluster you wish to deploy.
   ```bash
   terraform workspace new meta-prod
   ```

6. **Apply Terraform Configuration**:  
   Deploy the infrastructure for the selected client by specifying the correct `.tfvars` file.
   ```bash
   terraform apply -var-file=clients/meta.tfvars
   ```

7. **Access the Odoo Application**:  
   Once the deployment is complete, access the Odoo application by navigating to `https://<domain-name>`, replacing `<domain-name>` with the domain specified in the corresponding `.tfvars` file.
