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

resource "null_resource" "app" {
  depends_on = [aws_route53_record.roboshop]
  triggers = {
    always = timestamp()
  }
  provisioner "remote-exec" { # This let's the execution to happen on the remote node
    connection {
      host     = aws_instance.main.private_ip
      user     = "ec2-user"  # data.vault_generic_secret.ssh.data["username"]
      password = "DevOps321" # data.vault_generic_secret.ssh.data["password"]
    }

    inline = [
      "sudo pip3.11 install ansible",
      "pip3.11 install hvac",
      "ansible-pull  -i localhost, -U https://github.com/warmup-b60/roboshop-ansible.git -e component=${var.name} -e env=${var.env}  main.yml"
    ]
  }
}