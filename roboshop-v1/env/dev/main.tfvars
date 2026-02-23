
env          = "dev"

# Database specific variables for EC2
instances = {
  mongodb = {
    instance_type = "t3.small"
  }
  redis = {
    instance_type = "t3.small"
  }
  mysql = {
    instance_type = "t3.small"
  }
  rabbitmq = {
    instance_type = "t3.medium"
  }
}

ami_id    = "ami-0fcc78c828f981df2"
env       = "dev"
zone_id   = "Z056682820YKODKLCFUIZ"
zone_name = "roboshop.internal"

# EKS Cluster Specifit Variables
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

