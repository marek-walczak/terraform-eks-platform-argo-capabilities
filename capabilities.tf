resource "time_sleep" "wait_for_iam_propagation" {
  create_duration = "30s"

  depends_on = [
    aws_iam_role.argocd_capability
  ]
}

resource "aws_eks_capability" "argocd" {
  cluster_name              = aws_eks_cluster.this.name
  capability_name           = "${var.cluster_name}-argocd"
  type                      = "ARGOCD"
  role_arn                  = aws_iam_role.argocd_capability.arn
  delete_propagation_policy = "RETAIN"

  configuration {
    argo_cd {
      namespace = "argocd"

      aws_idc {
        idc_instance_arn = var.identity_center_instance_arn
        idc_region       = var.identity_center_region
      }

      dynamic "rbac_role_mapping" {
        for_each = var.argocd_rbac_mappings
        content {
          role = upper(rbac_role_mapping.value.role)

          identity {
            id   = rbac_role_mapping.value.identity_id
            type = rbac_role_mapping.value.identity_type
          }
        }
      }
    }
  }

  tags = local.common_tags

  depends_on = [
    time_sleep.wait_for_iam_propagation,
    aws_eks_node_group.platform
  ]
}