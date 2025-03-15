resource "aws_vpc" "vpc" {
    cidr_block = var.vpcconfig.cidr_block
    tags = {
        "Name" = var.vpcconfig.name
    }
}