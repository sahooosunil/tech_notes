vpc_cidr           = "10.1.0.0/16"
subnet_cidrs       = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24", "10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
availability_zones = ["ap-south-1a", "ap-south-1b"]
db_sg_ingress = [{
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  cidr_blocks = ["10.1.0.0/16"]
}]
db_sg_egress = [{
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["10.1.0.0/16"]
}]
db_user     = "fithealth2dbuser"
db_password = "welcome1"

ec2_ingress = [{
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = ["10.1.0.0/16"]
},
{
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["10.1.0.0/16"]
}]
ec2_egress = [{
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}]
public_key_file = "../sshkeys/terraformkp.pub"
private_key_file = "../sshkeys/terraformkp"
key_name        = "fithealth2kp"
instance_type   = "t2.micro"
ami             = "ami-03f4878755434977f"
bh_ec2_ingress = [{
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}]
bh_ec2_egress = [{
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}]
healthcheck_url = "HTTP:8080/fithealth2/healthcheck"
lbr_ec2_ingress = [{
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}]
lbr_ec2_egress = [{
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}]
