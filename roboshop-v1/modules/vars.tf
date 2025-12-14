variable "ami_id" {}
variable "instance_type" {}
variable "name" {}
# Variable env is used only for the roboshop components, not for the tools
variable "env" {
    default = null 
}

variable "zone_id" {}
variable "zone_name" {}
