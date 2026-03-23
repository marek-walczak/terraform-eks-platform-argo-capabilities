
# Terraform EKS Platform with ArgoCD Capability

This repository provides a simplified Terraform example for provisioning an AWS EKS-based platform, including networking, IAM, and ArgoCD capability enablement.

## What it includes

- VPC with public and private subnets
- EKS cluster with managed node group
- IAM roles for cluster and nodes
- Example ArgoCD capability using AWS EKS capabilities
- Placeholder support for AWS IAM Identity Center (IDC) integration

## Notes

- This is a simplified, non-production example
- Identity Center values and RBAC mappings must be provided via variables
- Intended to demonstrate platform design and Terraform structure