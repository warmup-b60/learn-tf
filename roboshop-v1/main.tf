module "eks" {
  source                     = "./modules/eks"
  env                        = var.env
  cluster_name               = var.cluster_name
  eks_version                = var.eks_version
  subnet_ids                 = var.subnet_ids
  eks_cluster_role_name      = var.eks_cluster_role_name
  eks_nodegroup_01_role_name = var.eks_nodegroup_01_role_name
  nodegroup_01_name          = var.nodegroup_01_name
  ng01_instance_types      = var.ng01_instance_types
}
