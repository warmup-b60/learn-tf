variable "env" { 
    description = "Environment for the EKS Cluster"
    type        = string
    default = "dev"
  }
variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type = string
  default = "roboshop-eks-cluster"
}

variable "eks_version" {
    description = "EKS Cluster version"
    type        = string
    default     = "1.33"
}

variable "subnet_ids" {
    description = "List of subnet IDs for the EKS cluster"
    type        = list(string)
    default = [
      "subnet-00ceb02053ec025ac",
      "subnet-070af22169c534e0e"
    ]
}

variable "eks_cluster_role_name" {
  description = "Name Of The IAM Role to be provisioned and will be used by EKS Cluster"
  type = string
  default = "roboshop-dev-eks-cluster-role"
}

variable "eks_nodegroup_01_role_name" {
    description = "Name Of The IAM Role to be provisioned and will be used by EKS Node Group"
    type = string
    default = "roboshop-dev-eks-nodegroup-role"
}

variable "nodegroup_01_name" {
    description = "Name of the EKS Node Group 01"
    type = string
    default = "roboshop-dev-eks-nodegroup-01"
}