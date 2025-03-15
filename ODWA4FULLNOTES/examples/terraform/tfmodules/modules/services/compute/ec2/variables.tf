variable "ec2config" {
  type = object({
    instance_type = string
    ami = string
    vpc_security_group_id = string
    associate_public_ip_address = bool
    name = string
    subnet_id = string
  })
}

variable "keypairconfig" {
  type = object({
    key_name = string
    public_key = string
  })
}