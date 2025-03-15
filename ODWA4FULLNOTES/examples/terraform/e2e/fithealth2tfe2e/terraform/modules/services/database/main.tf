resource "aws_db_subnet_group" "fithealth2dbsubnetgroup" {
  name = "fithealth2dbsubnetgroup"
  subnet_ids = var.db_subnet_ids
}

resource "aws_db_instance" "fithealth2db" {
  allocated_storage = 10
  db_name = "fithealthdb"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro"
  username = var.db_user
  password = var.db_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
  vpc_security_group_ids = [var.db_security_group_id]
  db_subnet_group_name = aws_db_subnet_group.fithealth2dbsubnetgroup.name
}