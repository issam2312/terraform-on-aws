terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~>1.4"
}

provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_instance" "ec2demo" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t3.micro"
}
