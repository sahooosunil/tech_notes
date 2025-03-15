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
resource "aws_security_group" "airtelcaresg" {
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
data "aws_key_pair" "terraformkp" {
  key_name           = "terraformkp"
  include_public_key = true
  filter {
    name   = "tag:Name"
    values = "terraformkp"
  }
}
resource "aws_instance" "javaserverec2" {
  ami                         = var.ec2instanceconfig.ami
  instance_type               = var.ec2instanceconfig.instance_type
  key_name                    = data.aws_key_pair.terraformkp.key_name
  vpc_security_group_ids      = [aws_security_group.airtelcaresg.id]
  associate_public_ip_address = var.ec2instanceconfig.associate_public_ip_address

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("~/.ssh/terraformkp")
  }

  provisioner "file" {
    source      = "sh/installjdk.sh"
    destination = "/tmp/installjdk.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/installjdk.sh",
      "bash /tmp/installjdk.sh"
    ]
  }
}

















