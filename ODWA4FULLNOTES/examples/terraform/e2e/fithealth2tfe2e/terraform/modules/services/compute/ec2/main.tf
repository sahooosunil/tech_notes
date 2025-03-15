resource "aws_instance" "fithealth2java" {
  subnet_id = var.ec2config.subnet_id
  instance_type = var.ec2config.instance_type
  ami = var.ec2config.ami
  key_name = var.ec2config.key_name
  vpc_security_group_ids = [var.ec2config.vpc_security_group_id]
  associate_public_ip_address = var.ec2config.associate_public_ip_address
}