dev-init: 
	rm -rf .terraform*
	terraform init --backend-config=./env/dev/state.tfvars --var-file=env/dev/main.tfvars

dev-plan: 
	terraform plan --backend-config=./env/dev/main.tfvars

dev-apply: dev-init
	terraform apply -auto-approve  --var-file=./env/dev/main.tfvars