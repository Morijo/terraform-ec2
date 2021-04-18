module "ec2" {
  source = "./modules/ec2"
  project = var.project
  aws_region = var.aws_region
  aws_vpc_id = module.network.aws_vpc
  aws_subnet_public_id = module.network.aws_subnet_public
  aws_security_group_id = module.network.aws_security_group

}

module "network" {
  source = "./modules/network"
}

module "route53" {
  source = "./modules/route53"
  aws_instance_public_ip = module.ec2.aws_instance.public_ip
}
