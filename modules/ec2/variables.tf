variable "project" {}
variable "aws_region"{}
variable "aws_vpc_id"{}
variable "aws_instance_type" {}
variable "aws_subnet_public_id"{}
variable "aws_security_group_id"{}

variable "aws_key_path" {
  description = "key_path"
  default = "/Users/joaopaulomorijo/.ssh/id_rsa.pub"
}
