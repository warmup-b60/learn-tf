tools-init: 
	rm -rf .terraform* || true
	git pull
	terraform init

tools-plan: dev-init
	terraform plan 

tools-apply: dev-init
	terraform apply
