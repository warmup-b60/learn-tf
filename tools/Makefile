tools-init: 
	rm -rf .terraform* || true
	git pull
	terraform init

tools-plan: tools-init
	terraform plan 

tools-apply: tools-init
	terraform apply
