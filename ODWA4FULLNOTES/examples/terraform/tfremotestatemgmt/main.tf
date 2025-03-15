terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "sailortfbucket"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "sailortflocktable"
  }
}
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}
resource "aws_security_group" "sailorjavasg" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "sailorjavakp" {
  key_name   = "sailor_kp"
  public_key = file("~/.ssh/terraformkp.pub")
}
resource "aws_instance" "sailorjavaec2" {
  instance_type          = "t2.nano"
  ami                    = "ami-03f4878755434977f"
  vpc_security_group_ids = [aws_security_group.sailorjavasg.id]
  key_name               = aws_key_pair.sailorjavakp.key_name
  tags = {
    "Name" = "sailorjavaec2"
    "Environment" = "dev"
  }
}














