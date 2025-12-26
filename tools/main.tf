module "tools" {
  for_each = var.tools

  source        = "../roboshop-v1/modules/"
  ami_id        = var.ami_id
  instance_type = each.value["instance_type"]
  name          = each.key
  zone_id       = var.zone_id
  zone_name     = var.zone_name
  env           = var.env
}