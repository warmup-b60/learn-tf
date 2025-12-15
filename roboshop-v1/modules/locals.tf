# locals {
#    name = var.env == "" ? "${var.name}" : "${var.name}-${var.env}"
# }

locals {
  env_normalized = coalesce(var.env, "")
  name           = local.env_normalized == "" ? var.name : "${var.name}-${local.env_normalized}"
}