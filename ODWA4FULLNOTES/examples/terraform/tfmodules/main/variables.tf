variable "vpc_cidr" {
  type = string
  description = "vpc cidr"
  default = "10.1.0.0/16"
}

variable "vpc_name" {
  type = string
  description = "vpc name"
  default = "javaservervpc"
}