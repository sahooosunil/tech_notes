resource "aws_key_pair" "fithealth2kp" {
  key_name = var.key_name
  public_key = var.public_key
  tags = {
    "Name" = "fithealth2javakp"
  }
}