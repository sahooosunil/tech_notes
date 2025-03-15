variable "subnetconfig" {
  type = object({
    vpc_id = string
    cidr_block = string
    availability_zone = string
    name = string
  })
}