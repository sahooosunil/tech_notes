variable "vpc_id" {
  type = string
}
variable "db_security_group_id" {
  type = string
}
variable "db_user" {
  type = string
}
variable "db_password" {
  type = string
}
variable "db_subnet_ids" {
  type = list
}
