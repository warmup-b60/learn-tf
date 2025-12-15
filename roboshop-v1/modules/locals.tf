locals {
   name = var.env == "" ? "${var.name}" : "${var.name}-${var.env}"
}