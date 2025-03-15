variable "igwconfig" {
  type = object({
    vpc_id = string
    name = string
    associated_subnet_id = string
    route_cidr_block = string
  })
}