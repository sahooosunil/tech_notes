terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.32.1"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

resource "aws_vpc" "rapidovpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "rapidovpc"
  }
}

resource "aws_subnet" "rapidopubsn" {
  vpc_id            = aws_vpc.rapidovpc.id
  availability_zone = "ap-south-1a"
  cidr_block        = var.subnet1_cidr
  tags = {
    "Name" = "rapidopubsn"
  }
}

resource "aws_internet_gateway" "rapidoigw" {
  vpc_id = aws_vpc.rapidovpc.id
  tags = {
    "Name" = "rapidoigw"
  }
}

resource "aws_route_table" "rapidoigwrt" {
  vpc_id = aws_vpc.rapidovpc.id
  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.rapidoigw.id
  }
  tags = {
    "Name" = "rapidoigwrt"
  }
}

resource "aws_route_table_association" "rapidortpubsnassociation" {
  route_table_id = aws_route_table.rapidoigwrt.id
  subnet_id      = aws_subnet.rapidopubsn.id
}

resource "aws_security_group" "rapidoec2sg" {
  vpc_id = aws_vpc.rapidovpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "rapidoec2sg"
  }
}

resource "aws_key_pair" "terraformkp" {
  public_key = var.keypair.public_key
  key_name   = var.keypair.key_name
  tags = {
    "Name" = "terraformkp"
  }
}

resource "aws_instance" "rapidoec2" {
  subnet_id                   = aws_subnet.rapidopubsn.id
  vpc_security_group_ids      = [aws_security_group.rapidoec2sg.id]
  instance_type               = var.ec2instanceconfig.instance_type
  ami                         = var.ec2instanceconfig.ami
  key_name                    = aws_key_pair.terraformkp.key_name
  associate_public_ip_address = var.ec2instanceconfig.associate_public_ip
  tags = {
    "Name" = "rapidoec2"
  }
}

















