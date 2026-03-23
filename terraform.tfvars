region             = "eu-west-2"
environment        = "dev"
cluster_name       = "platform-eks-dev"
kubernetes_version = "1.34"

# AWS IAM Identity Center (required for ArgoCD capability)
identity_center_instance_arn = "arn:aws:sso:::instance/ssoins-xxxxxxxxxxxxxxxx"
identity_center_region       = "eu-west-2"

# Example RBAC mapping (replace with real Identity Center IDs)
argocd_rbac_mappings = [
  {
    role          = "admin"
    identity_id   = "example-identity-id"
    identity_type = "SSO_GROUP"
  }
]