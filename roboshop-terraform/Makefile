dev-init: 
	rm -rf .terraform*
	terraform init --backend-config=./env/dev/state.tfvars --var-file=env/dev/main.tfvars

dev-plan: 
	terraform plan --var-file=env/dev/main.tfvars

dev-apply: dev-init
	terraform apply -auto-approve  --var-file=./env/dev/main.tfvars


prod-init: 
	rm -rf .terraform*
	terraform init --backend-config=./env/prod/state.tfvars --var-file=env/prod/main.tfvars

prod-plan: 
	terraform plan --var-file=env/prod/main.tfvars

prod-apply: dev-init
	terraform apply -auto-approve  --var-file=./env/prod/main.tfvars