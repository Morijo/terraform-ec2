# Terraform-ec2
This project aims to create an ec2 instance to run a web application.
To meet these requirements and be able to reuse the code, this project is divided into 3 (three) modules (EC2/Network/Route53).

## Modules

- [EC2] Responsible for all instance configuration and monitoring.
- [Network] Responsible for creating VPC, public and private subnet, routing table, gateway and security group.
- [Route53] Responsible for creating the dns that is used in the application.

## Deploy

To execute the terraform, you must change the variables present at the root of the project [variables.tf](https://github.com/Morijo/terraform-ec2/blob/master/variables.tf)

To execute the application that will be launched in the docker, the aws account credentials present in the file must be changed [commons.sh](https://github.com/Morijo/terraform-ec2/blob/master/scripts/commons.sh)

Then, execute the following commands to deploy the EC2: 
```sh
terraform init
terraform validate
terraform plan -out intention
terraform apply intention
```

> Note: This ec2 has releases on ports 80 (http), 443 (https) and 22 (ssh), port 22 can be removed from the security group if necessary, on ec2 the SSM agent is already installed.
