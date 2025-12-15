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
  length(trimspace(coalesce(var.env, ""))) > 0 ?
  "ansible-pull -i localhost, -U https://github.com/warmup-b60/roboshop-ansible.git -e component=${var.name} -e env=${var.env} main.yml"
  :
  "ansible-pull -i localhost, -U https://github.com/warmup-b60/roboshop-ansible.git -e component=${var.name} main.yml"
]


  }
}

