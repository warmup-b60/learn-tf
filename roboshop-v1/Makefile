dev-init: 
	rm -rf .terraform* || true
	git pull
	terraform init --backend-config=./env/dev/state.tfvars -var token=$(token)

dev-plan: dev-init
	terraform plan --var-file=env/dev/main.tfvars -var token=$(token)

dev-apply: dev-init
	terraform apply -auto-approve  --var-file=./env/dev/main.tfvars  -var token=$(token)

dev-destroy: dev-init
	terraform destroy -auto-approve  --var-file=./env/dev/main.tfvars -var token=$(token)

prod-init: 
	rm -rf .terraform* || true
	terraform init --backend-config=./env/prod/state.tfvars

prod-plan: 
	terraform plan --var-file=env/prod/main.tfvars -var token=$(token)

prod-apply: dev-init
	terraform apply -auto-approve  --var-file=./env/prod/main.tfvars -var token=$(token)

prod-destroy: prod-init
	terraform destroy -auto-approve  --var-file=./env/prod/main.tfvars -var token=$(token)