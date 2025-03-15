resource "aws_internet_gateway" "igw" {
  vpc_id = var.igwconfig.vpc_id
  tags = {
    "Name" = var.igwconfig.name
  }
}

resource "aws_route_table" "igwrt" {
  vpc_id = var.igwconfig.vpc_id

  route {
    cidr_block = var.igwconfig.route_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    "Name" = "${var.igwconfig.name}rt"
  }
}

resource "aws_route_table_association" "igwrtassoc" {
  route_table_id = aws_route_table.igwrt.id
  subnet_id = var.igwconfig.associated_subnet_id
}