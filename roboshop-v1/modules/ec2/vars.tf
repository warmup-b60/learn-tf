variable "ami_id" {}
variable "instance_type" {}
variable "name" {}
variable "env" {}
variable "zone_id" {}
variable "zone_name" {}
variable "token" {}
variable "iam_policy" {
  default = []
}