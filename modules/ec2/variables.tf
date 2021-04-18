variable "aws_vpc_id"{}
variable "aws_security_group_id"{
  type = string
}
variable "aws_subnet_public_id"{}

variable "aws_region"{
  default = "us-east-1" 
}

variable "aws_instance_type" {
  default = "t2.micro"  
}

variable "project" {}

variable "aws_key_path" {
  description = "key_path"
  default = "/Users/joaopaulomorijo/.ssh/id_rsa.pub"
}