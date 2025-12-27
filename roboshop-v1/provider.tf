provider "aws" {}

terraform {
  backend "s3" {}
}

provider "vault" {
  address         = "http://vault-tools.roboshop.internal:8200/"
  token           = var.token
  skip_tls_verify = true
}