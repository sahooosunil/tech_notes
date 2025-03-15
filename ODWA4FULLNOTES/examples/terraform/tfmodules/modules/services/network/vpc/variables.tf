variable "vpcconfig" {
  type = object({
    cidr_block = string
    name = string
  })
}