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

module "javaservervpc" {
  source = "../modules/services/network/vpc"
  vpcconfig = {
    cidr_block = var.vpc_cidr
    name = var.vpc_name
  }
}

module "javaserversubnet" {
  source = "../modules/services/network/subnet"
  subnetconfig = {
    cidr_block = "10.1.1.0/24"
    name = "javaserversubnet"
    availability_zone = "ap-south-1a"
    vpc_id = module.javaservervpc.vpc_id
  }
}

module "javaserverigw" {
  source = "../modules/services/network/igw"
  igwconfig = {
    associated_subnet_id = module.javaserversubnet.subnet_id
    route_cidr_block = "0.0.0.0/0"
    name = "javaserverigw"
    vpc_id = module.javaservervpc.vpc_id
  }
}

module "javaserversg" {
  source = "../modules/services/compute/securitygroup"
  sgconfig = {
    vpc_id = module.javaservervpc.vpc_id
    name = "javaserversg"
    ingress = {
      from_port = 22
      to_port = 22
      cidr_block = "0.0.0.0/0"
      protocol = "tcp"
    }
    egress = {
      from_port = 0
      to_port =0
      protocol = "-1"
      cidr_block = "0.0.0.0/0"
    }
  }
}

module "javaserverec2" {
  source = "../modules/services/compute/ec2"
  ec2config = {
    ami = "ami-03f4878755434977f"   
    instance_type = "t2.micro"
    vpc_security_group_id = module.javaserversg.security_group_id
    associate_public_ip_address = true
    name = "javaserverec2"
    subnet_id = module.javaserversubnet.subnet_id
  }
  keypairconfig = {
    key_name = "javaserverkp"
    public_key = file("~/.ssh/terraformkp.pub")
  }
}
