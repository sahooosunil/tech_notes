resource "aws_eip" "fithealth2eip" {
}

resource "aws_nat_gateway" "fithealth2nt" {
    subnet_id = var.public_subnet_id
    allocation_id = aws_eip.fithealth2eip.id
}

resource "aws_route_table" "fithealth2ngrt" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.fithealth2nt.id
  }
  tags = {
    "Name" = "fithealth2natgw"
  }
}
resource "aws_route_table_association" "fithealth2ngrtassoc" {
  count = length(var.subnet_ids)
  subnet_id = element(var.subnet_ids, count.index)
  route_table_id = aws_route_table.fithealth2ngrt.id
}

