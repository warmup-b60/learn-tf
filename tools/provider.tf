provider "aws" {
    region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "warmup-b60-tf-bucket"
    key    = "robotshop-tools/terraform.tfstate"
    region = "us-east-1"
  }
}