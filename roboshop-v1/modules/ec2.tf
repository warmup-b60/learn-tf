resource "aws_instance" "main" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = local.name 
    # Name = var.env == null ? "${var.name}" : "${var.name}-${var.env}"
  }
}

variable "security_group_id" {
  description = "The ID of the existing security group."
  type        = string
  default     = "sg-057e0b9b259713373"
}