resource "aws_key_pair" "key_pair" {
  key_name = var.keypairconfig.key_name
  public_key = var.keypairconfig.public_key
}

resource "aws_instance" "ec2instance" {
  subnet_id = var.ec2config.subnet_id
  instance_type = var.ec2config.instance_type
  ami = var.ec2config.ami
  vpc_security_group_ids = [var.ec2config.vpc_security_group_id]
  associate_public_ip_address = var.ec2config.associate_public_ip_address
  key_name = aws_key_pair.key_pair.key_name
  tags = {
    "Name" = var.ec2config.name
  }
}