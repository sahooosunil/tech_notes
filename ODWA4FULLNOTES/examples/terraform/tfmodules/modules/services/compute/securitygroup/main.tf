resource "aws_security_group" "sg" {
  vpc_id = var.sgconfig.vpc_id
  ingress {
    from_port = var.sgconfig.ingress.from_port
    to_port = var.sgconfig.ingress.to_port
    protocol = var.sgconfig.ingress.protocol
    cidr_blocks = [var.sgconfig.ingress.cidr_block]
  }
  egress {
    from_port = var.sgconfig.egress.from_port
    to_port = var.sgconfig.egress.to_port
    protocol = var.sgconfig.egress.protocol
    cidr_blocks = [var.sgconfig.egress.cidr_block]
  }
  tags = {
    "Name" = var.sgconfig.name
  }
}