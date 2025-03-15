variable "availability_zones" {
  type = list(string)
}
variable "lbr_subnet_ids" {
  type = list(string)
}
variable "ec2_instance_ids" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "instance_port" {
  type = number
}
variable "vpc_security_group_id" {
  type = string
}
variable "target" {
  type = string
}
