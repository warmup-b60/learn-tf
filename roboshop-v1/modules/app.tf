resource "null_resource" "app" {
  depends_on = [aws_route53_record.roboshop]
  triggers = {
    always = timestamp()
  }
  provisioner "remote-exec" { # This let's the execution to happen on the remote node
    connection {
      host     = aws_instance.main.private_ip
      user     = data.vault_generic_secret.ssh.data["ssh_user"]
      password = data.vault_generic_secret.ssh.data["ssh_pass"]
    }
    inline = [
      "pip3.11 install ansible",
      "ansible-galaxy collection install community.hashi_vault", # This is to install vault collection
      "ansible-pull -i localhost, -U https://github.com/warmup-b60/roboshop-ansible.git -e component=${var.name} -e env=${var.env}  -e token=${var.token} main.yml"
    ]

  }
}
