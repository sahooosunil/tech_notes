resource "aws_internet_gateway" "fithealth2ig" {
  vpc_id = var.vpc_id
}
resource "aws_route_table" "fithealth2igrt" {
  route {
    gateway_id = aws_internet_gateway.fithealth2ig.id
    cidr_block = "0.0.0.0/0"
  }
  vpc_id = var.vpc_id
  tags = {
    "Name" = "fithealth2igrt"
  }
}

resource "aws_route_table_association" "fithealth2igsubassoc" {
    count = length(var.subnet_ids)
    subnet_id = element(var.subnet_ids, count.index)
    route_table_id = aws_route_table.fithealth2igrt.id
}



