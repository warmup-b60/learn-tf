tools-init: 
	rm -rf .terraform* || true
	git pull
	terraform init

tools-plan: tools-init
	terraform plan  -var env=tools 

tools-apply: tools-init
	terraform apply -auto-approve
	terraform apply -auto-approve -var env=tools
