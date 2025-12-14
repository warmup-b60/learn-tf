module "tools" {
  for_each = var.tools 
  
  source        = "./modules/roboshop-v1"
  ami_id        = var.ami_id
  instance_type = each.value["instance_type"]
  name          = each.key
  zone_id       = var.zone_id
  zone_name     = var.zone_name
}