provider "vault" {
  address = "http://172.31.67.238:8200"
  token   = var.token # Use the provided token for authentication
}

variable "token" {
    type    = string
    default = "your-vault-token"
}

data "vault_generic_secret" "rundeck_auth" {
  path = "kv/demo"
}

output "secret" {
    value = data.vault_generic_secret.rundeck_auth.data   
    sensitive = true
}
