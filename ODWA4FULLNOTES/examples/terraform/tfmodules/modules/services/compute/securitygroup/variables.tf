
variable "sgconfig" {
  type = object({
    vpc_id = string
    name = string
    ingress = object({
      from_port = number
        to_port = number
        protocol = string
        cidr_block = string  
    })
    egress = object({
      from_port = number
        to_port = number
        protocol = string
        cidr_block = string  
    })
  })
}