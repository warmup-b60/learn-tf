dev-init: 
    git pull
	terraform init --backend-config=./env/dev/state.tfvars --var-file=env/dev/main.tfvars

dev-plan: 
	terraform plan --backend-config=./env/dev/main.tfvars

dev-apply: dev-init ; dev-plan
	terraform apply -auto-approve  --var-file=./env/dev/main.tfvars