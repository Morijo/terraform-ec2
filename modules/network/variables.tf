variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "public_cidr" {
  default = "192.168.1.0/24"
}

variable "private_cidr" {
  default = "192.168.6.0/23"
}

variable "aws_region" {
  default = "us-east-1"
}