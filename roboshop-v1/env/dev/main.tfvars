env          = "dev"
cluster_name = "roboshop-eks-cluster"
eks_version  = "1.33"
subnet_ids = [
  "subnet-00ceb02053ec025ac",
  "subnet-070af22169c534e0e"
]
eks_cluster_role_name      = "roboshop-eks-cluster-role"
eks_nodegroup_01_role_name = "roboshop-eks-nodegroup-01-role"
nodegroup_01_name          = "roboshop-eks-nodegroup-01"
ng01_instance_types        = ["t3.medium", "t3.small"]