terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}
provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}
module "fithealth2_vpc_module" {
  source   = "../modules/services/network/vpc"
  vpc_cidr = var.vpc_cidr
}
module "fithealth2_subnet_module" {
  count             = length(var.subnet_cidrs)
  source            = "../modules/services/network/subnet"
  vpc_id            = module.fithealth2_vpc_module.vpc_id
  subnet_cidr       = element(var.subnet_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)
  subnet_name       = "fithealth2subnet_${count.index}"
}

module "fithealth2_ig_module" {
  source     = "../modules/services/network/gateway/ig"
  vpc_id     = module.fithealth2_vpc_module.vpc_id
  subnet_ids = [module.fithealth2_subnet_module[4].subnet_id, module.fithealth2_subnet_module[5].subnet_id]
}
module "fithealth2_ng_module" {
  source           = "../modules/services/network/gateway/ng"
  public_subnet_id = module.fithealth2_subnet_module[4].subnet_id
  subnet_ids       = [module.fithealth2_subnet_module[2].subnet_id, module.fithealth2_subnet_module[3].subnet_id]
  vpc_id           = module.fithealth2_vpc_module.vpc_id
}
module "fithealth2_db_security_group_module" {
  source              = "../modules/services/network/securitygroup"
  vpc_id              = module.fithealth2_vpc_module.vpc_id
  security_group_name = "fithealth2dbsecuritygroup"
  ingress             = var.db_sg_ingress
  egress              = var.db_sg_egress
}
module "fithealth2_mysql_instance_module" {
  source               = "../modules/services/database"
  vpc_id               = module.fithealth2_vpc_module.vpc_id
  db_security_group_id = module.fithealth2_db_security_group_module.security_group_id
  db_user              = var.db_user
  db_password          = var.db_password
  db_subnet_ids        = [module.fithealth2_subnet_module[0].subnet_id, module.fithealth2_subnet_module[1].subnet_id]
}
module "fithealth2_key_pair_module" {
  source     = "../modules/services/compute/keypair"
  key_name   = var.key_name
  public_key = file(var.public_key_file)
}
module "fithealth2_ec2_security_group_module" {
  source              = "../modules/services/network/securitygroup"
  vpc_id              = module.fithealth2_vpc_module.vpc_id
  security_group_name = "fithealth2ec2securitygroup"
  ingress             = var.ec2_ingress
  egress              = var.ec2_egress
}
module "fithealth2_ec2_instance" {
  count  = 2
  source = "../modules/services/compute/ec2"
  ec2config = {
    instance_type               = var.instance_type
    ami                         = var.ami
    subnet_id                   = module.fithealth2_subnet_module[count.index + 2].subnet_id
    associate_public_ip_address = false
    vpc_security_group_id       = module.fithealth2_ec2_security_group_module.security_group_id
    key_name                    = module.fithealth2_key_pair_module.key_name
  }
}
module "fithealth2_bh_security_group_module" {
  source              = "../modules/services/network/securitygroup"
  vpc_id              = module.fithealth2_vpc_module.vpc_id
  security_group_name = "fithealth2ec2securitygroup"
  ingress             = var.bh_ec2_ingress
  egress              = var.bh_ec2_egress
}
module "fithealth2_bation_instance" {
  source = "../modules/services/compute/ec2"
  ec2config = {
    instance_type               = var.instance_type
    ami                         = var.ami
    subnet_id                   = module.fithealth2_subnet_module[4].subnet_id
    associate_public_ip_address = true
    vpc_security_group_id       = module.fithealth2_bh_security_group_module.security_group_id
    key_name                    = module.fithealth2_key_pair_module.key_name
  }
  depends_on = [module.fithealth2_ng_module, module.fithealth2_mysql_instance_module]
}
module "fithealth2_lbr_security_group_module" {
  source              = "../modules/services/network/securitygroup"
  vpc_id              = module.fithealth2_vpc_module.vpc_id
  security_group_name = "fithealth2ec2securitygroup"
  ingress             = var.lbr_ec2_ingress
  egress              = var.lbr_ec2_egress
}
module "fithealth2_elb" {
  source                = "../modules/services/compute/lbr"
  vpc_id                = module.fithealth2_vpc_module.vpc_id
  availability_zones    = var.availability_zones
  lbr_subnet_ids        = [module.fithealth2_subnet_module[4].subnet_id, module.fithealth2_subnet_module[5].subnet_id]
  ec2_instance_ids      = module.fithealth2_ec2_instance[*].ec2_instance_id
  instance_port         = 8080
  vpc_security_group_id = module.fithealth2_lbr_security_group_module.security_group_id
  target                = var.healthcheck_url
}

resource "null_resource" "replace_db_connect_string_and_buildmvn" {
  provisioner "local-exec" {
    command = "sed -i 's/CONNECT_STRING/${module.fithealth2_mysql_instance_module.db_endpoint}/g' ../../src/main/resources/db.properties && mvn -f ../../pom.xml clean verify"
  }
  depends_on = [module.fithealth2_mysql_instance_module]
}

resource "null_resource" "copy_files_to_bastion_host" {
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_file)
      host        = module.fithealth2_bation_instance.ec2_public_ip
    }
    source      = var.private_key_file
    destination = "/home/ubuntu/.ssh/terraform"
  }
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_file)
      host        = module.fithealth2_bation_instance.ec2_public_ip
    }
    source      = "../../src/main/db/db-schema.sql"
    destination = "/tmp/db-schema.sql"
  }
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_file)
      host        = module.fithealth2_bation_instance.ec2_public_ip
    }
    source      = "../../config/tomcat.service"
    destination = "/tmp/tomcat.service"
  }
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_file)
      host        = module.fithealth2_bation_instance.ec2_public_ip
    }
    source      = "../../target/fithealth2.war"
    destination = "/tmp/fithealth2.war"
  }
  provisioner "file" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_file)
      host        = module.fithealth2_bation_instance.ec2_public_ip
    }
    source      = "../../ansible/tomcat-playbook.yml"
    destination = "/tmp/tomcat-playbook.yml"
  }
  depends_on = [module.fithealth2_bation_instance,
  resource.null_resource.replace_db_connect_string_and_buildmvn]
}
resource "null_resource" "ansible_install_remote_exec_bastionhost" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_file)
      host        = module.fithealth2_bation_instance.ec2_public_ip
    }
    inline = [
      "sudo chmod 600 /home/ubuntu/.ssh/terraform",
      "sudo apt update -y",
      "sudo apt install -y ansible",
      "sudo apt install -y mysql-client-8.0",
      "printf '%s\n%s' ${module.fithealth2_ec2_instance[0].ec2_private_ip} ${module.fithealth2_ec2_instance[1].ec2_private_ip} > /tmp/fithealth2hosts",
      "mysql -h ${module.fithealth2_mysql_instance_module.db_address} -u${var.db_user} -p${var.db_password} < /tmp/db-schema.sql",
      "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook --private-key ~/.ssh/terraform -i /tmp/fithealth2hosts /tmp/tomcat-playbook.yml"
    ]
  }
  depends_on = [module.fithealth2_bation_instance,
  resource.null_resource.copy_files_to_bastion_host]
}
