variable "env" {
  description = "Environment for the EKS Cluster"
  type        = string
}
variable "cluster_name" {
  description = "Name of the EKS Cluster"
  type        = string
}

variable "eks_version" {
  description = "EKS Cluster version"
  type        = string
  default     = "1.33"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "eks_cluster_role_name" {
  description = "Name Of The IAM Role to be provisioned and will be used by EKS Cluster"
  type        = string
}

variable "eks_nodegroup_01_role_name" {
  description = "Name Of The IAM Role to be provisioned and will be used by EKS Node Group"
  type        = string
}

variable "nodegroup_01_name" {
  description = "Name of the EKS Node Group 01"
  type        = string
}

variable "ng01_instance_types" {
  description = "Instance Type to be used on ng01"
  type        = list(string)
}