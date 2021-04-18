terraform {
  required_version = "~> 0.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "stone-iac"
    key    = "terraform-stone.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
    region  = var.aws_region
}