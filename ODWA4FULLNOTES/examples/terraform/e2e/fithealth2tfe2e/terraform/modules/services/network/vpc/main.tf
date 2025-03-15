resource "aws_vpc" "fithealth2vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "fithealth2vpc"
  }
}