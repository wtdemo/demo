# tf-demo

local backend:

export TF_VAR_ENV=it
tf plan --auto-approve -state=$TF_VAR_ENV/terraform.tfstate -var-file=$TF_VAR_ENV/$TF_VAR_ENV.tfvars

Remote Backend
export TF_VAR_ENV=uat
tf destroy -var-file=$TF_VAR_ENV/$TF_VAR_ENV.tfvars
