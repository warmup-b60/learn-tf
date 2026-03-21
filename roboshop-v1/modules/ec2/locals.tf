locals {
  name       = var.env == null ? "${var.name}" : "${var.name}-${var.env}"
  iam_policy = concat(["sts:GetCallerIdentity"], var.iam_policy)
}
