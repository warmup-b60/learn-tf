module "ec2" {
  for_each = var.instances

  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = each.value["instance_type"]
  env           = var.env
  name          = each.key
  zone_id       = var.zone_id
  zone_name     = var.zone_name
  token         = var.token
}



module "eks" {
  source        = "./modules/eks"
}
