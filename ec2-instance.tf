# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.6.2"
      #version = "~> 4.65" # Optional but recommended in production
    }
  }
}


# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "us-east-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-0533f2ba8a1995cf9" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.key-value
}

variable "key-value" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type = string
  default = "key"
}



