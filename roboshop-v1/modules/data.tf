data "vault_generic_secret" "ssh" {
  path = "roboshop-dev/ssh_cred"
}