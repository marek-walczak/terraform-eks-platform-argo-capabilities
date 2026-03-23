variable "region" {
  description = "AWS region for the platform"
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "platform-eks-dev"
}

variable "kubernetes_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.34"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.20.11.0/24", "10.20.12.0/24"]
}

variable "node_instance_types" {
  description = "EKS managed node group instance types"
  type        = list(string)
  default     = ["t3.large"]
}

variable "node_desired_size" {
  description = "Desired node count"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum node count"
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum node count"
  type        = number
  default     = 4
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}

variable "identity_center_instance_arn" {
  description = "AWS IAM Identity Center instance ARN used for ArgoCD capability integration"
  type        = string
  default     = null
}

variable "identity_center_region" {
  description = "Region for AWS IAM Identity Center"
  type        = string
  default     = "eu-west-2"
}

variable "argocd_rbac_mappings" {
  description = "Optional RBAC mappings for ArgoCD capability"
  type = list(object({
    role          = string
    identity_id   = string
    identity_type = string
  }))
  default = []
}