locals {
   name = var.env == null ? "${var.name}" : "${var.name}-${var.env}"
}

# locals {
#   env_normalized = try(var.env, "")
#   name           = local.env_normalized == "" ? var.name : "${var.name}-${local.env_normalized}"
# }