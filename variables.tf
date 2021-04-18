#### Global
variable "project" { default = "challenge" }
variable "aws_region" { default = "us-east-1" }
variable "aws_instance_type" { default = "t2.micro" }

#### Network
variable "aws_vpc_cidr" { default = "192.168.0.0/16" }
variable "aws_public_cidr" { default = "192.168.1.0/24" }
variable "aws_private_cidr" { default = "192.168.6.0/23" }

#### DNS
variable "aws_dns_id" { default = "Z0010070OXL10M6ONM6K" }
variable "aws_dns_domain_name" { default = "api.morijo.com.br" }
variable "aws_dns_type" { default = "A" }
variable "aws_dns_ttl" { default = 300 }