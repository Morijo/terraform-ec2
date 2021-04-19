module "ec2" {
  source = "./modules/ec2"
  project = var.project
  aws_region = var.aws_region
  aws_instance_type = var.aws_instance_type
  aws_vpc_id = module.network.aws_vpc
  aws_subnet_public_id = module.network.aws_subnet_public
  aws_security_group_id = module.network.aws_security_group
  }

module "network" {
  source = "./modules/network"
  project = var.project
  aws_region = var.aws_region
  aws_instance_type = var.aws_instance_type
  aws_vpc_cidr = var.aws_vpc_cidr
  aws_public_cidr = var.aws_public_cidr
  aws_private_cidr = var.aws_private_cidr
}

module "route53" {
  source = "./modules/route53"
  aws_dns_id = var.aws_dns_id
  aws_dns_domain_name = var.aws_dns_domain_name
  aws_dns_type = var.aws_dns_type
  aws_dns_ttl = var.aws_dns_ttl
  aws_instance_public_ip = module.ec2.aws_instance.public_ip

}
