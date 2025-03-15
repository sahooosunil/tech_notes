resource "aws_subnet" "subnet" {
  vpc_id = var.subnetconfig.vpc_id
  cidr_block = var.subnetconfig.cidr_block
  availability_zone = var.subnetconfig.availability_zone
  tags = {
    "Name" = var.subnetconfig.name
  }
}