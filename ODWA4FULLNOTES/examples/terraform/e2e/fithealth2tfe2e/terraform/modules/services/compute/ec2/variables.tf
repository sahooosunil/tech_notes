variable "ec2config" {
  type = object({
    instance_type =  string
    ami = string
    subnet_id = string
    associate_public_ip_address = bool
    vpc_security_group_id = string
    key_name = string
  })
}
