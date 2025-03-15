terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

resource "aws_vpc" "fithealth2vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    "Name" = "fithealth2vpc"
  }
}

resource "aws_subnet" "fithealth2subnet" {
  vpc_id = aws_vpc.fithealth2vpc.id
  cidr_block = "10.1.1.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    "Name" = "fithealth2subnet"
  }
}

resource "aws_security_group" "fithealth2sg" {
    vpc_id = aws_vpc.fithealth2vpc.id
    ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["10.1.0.0/16"]
    }
    egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "fithealth2kp" {
  key_name = "terraformkp"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6GDUsHtTZDK8efoEB+YPHfN+24o2OLNJ+viAvk1kLrk9sTicFmzMa+EOej1Z/XCNzsJgoDt5XqDJcID+36f7jEucKIr4PpDg3nx7aNp4VXNqlMmfsLES6Q4rtgQIG6h/vxQDRw9zTS4UlC59/Vs+2ERs6yK+Ajurn6VIV9BvtDpKnQ8KOgcGjvoFcZE/4dv8lGfUbJ49UAnoyGYCkqH0A3W9sIcbTOFCAPslGNTVGl8wd56GrX8Q7Kpnq9AW6xfkgMMUS+IsHJJxMjTgbXPy5WAOnmLob0PCkWQA02v92PlRawzS40mEY5EVCOabJl2AG0780FKqIM751RU5hEZ4Xobn1zYFMs2KU1EWT2j/Sh0mTuKvMyS33GU2NmTg3Big76/U5WNJu1t2K4eUfsr47hN+0KWWWWo7/8EBKHU97VkOao77MqJwhZrED1Lw8GXigrJoYFYMr7Z/qkubhx+N1KzmKm1AtwgUANUpdUq8Xfo4X8mhbK5QHtsanK1Vl31s= techs@TechTitans"
}

resource "aws_instance" "fithealth2ec2" {
  subnet_id = aws_subnet.fithealth2subnet.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.fithealth2sg.id]
  ami = "ami-03f4878755434977f"
  key_name = aws_key_pair.fithealth2kp.key_name
  tags = {
    "Name" = "fithealth2ec2"
  }
}












