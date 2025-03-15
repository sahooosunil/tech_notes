terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
  region = "ap-south-1"
}

resource "aws_key_pair" "tfstatekp" {
  key_name = "tfstatekp"
  public_key = file("~/.ssh/terraformkp.pub")
}

resource "aws_security_group" "tfsg" {
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "tfstateec2" {
  instance_type = "t2.micro"
  ami = "ami-03f4878755434977f"
  key_name = aws_key_pair.tfstatekp.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.tfsg.id]
}