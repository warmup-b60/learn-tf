# Module that provisions the EC2 Instances for the Database
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

# Module that provisions the EKS Cluster and Nodegroup

module "eks" {
  source                     = "./modules/eks"
  env                        = var.env
  cluster_name               = var.cluster_name
  eks_version                = var.eks_version
  subnet_ids                 = var.subnet_ids
  eks_cluster_role_name      = var.eks_cluster_role_name
  eks_nodegroup_01_role_name = var.eks_nodegroup_01_role_name
  nodegroup_01_name          = var.nodegroup_01_name
  ng01_instance_types        = var.ng01_instance_types
}
