Make sure you put a vm.tf in a folder.
Open a Terminal in Visual Studio Code
Commands to run 

az login 

# Set subscription by Id
az account set --subscription XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

# Set subscription by Name
az account set --subscription "Company Subscription"

terraform init

terraform validate

terraform plan

terraform apply -auto-approve
