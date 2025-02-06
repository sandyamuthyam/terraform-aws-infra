# Create environment folders and files
mkdir -p environments/{dev,staging,prod}
touch environments/dev/{main.tf,variables.tf,outputs.tf,terraform.tfvars}
touch environments/staging/{main.tf,variables.tf,outputs.tf,terraform.tfvars}
touch environments/prod/{main.tf,variables.tf,outputs.tf,terraform.tfvars}

# Create module folders and files
mkdir -p modules/{vpc,compute,database}
touch modules/vpc/{main.tf,variables.tf,outputs.tf}
touch modules/compute/{main.tf,variables.tf,outputs.tf}
touch modules/database/{main.tf,variables.tf,outputs.tf}

# Create scripts folder and init script
mkdir scripts
touch scripts/init.sh

# Create the README file
touch README.md
