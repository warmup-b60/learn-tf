variable "tools" {
    default = {
        vault = {
            instance_type = "t3.small"
        }
    }
}

variable "ami_id" {
    default = "ami-0fcc78c828f981df2"
}
variable "env" {
    default = ""
}

variable "zone_id" {
    default = "Z056682820YKODKLCFUIZ"
}
variable "zone_name" {
    default = "roboshop.internal"
}
