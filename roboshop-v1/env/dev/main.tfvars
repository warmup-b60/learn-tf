instances = {
  frontend = {
    instance_type = "t3.micro"
  }
  mongodb = {
    instance_type = "t3.micro"
  }
  catalogue = {
    instance_type = "t3.micro"
  }
  redis = {
    instance_type = "t3.micro"
  }
  user = {
    instance_type = "t3.micro"
  }

  cart = {
    instance_type = "t3.micro"
  }

  # mysql = {
  #   instance_type = "t3.micro"
  # }
  # shipping = {
  #   instance_type = "t3.micro"
  # }
  # payment = {
  #   instance_type = "t3.micro"
  # }
  # rabbitmq = {
  #   instance_type = "t3.medium"
  # }
}

ami_id    = "ami-0fcc78c828f981df2"
env       = "dev"
zone_id   = "Z056682820YKODKLCFUIZ"
zone_name = "roboshop.internal"