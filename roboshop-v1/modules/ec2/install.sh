#!/bin/bash

# Optional environment variable
if [ -z "$env" ]; then
  ansible-pull -i localhost, -U https://github.com/warmup-b60/roboshop-ansible.git \
    -e component="" main.yml
else
  ansible-pull -i localhost, -U https://github.com/warmup-b60/roboshop-ansible.git -e component="${var.name}" -e env="${var.env}" main.yml
fi
