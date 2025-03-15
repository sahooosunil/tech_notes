variable "ec2instanceconfig" {
  type = object({
    ami                         = string
    instance_type               = string
    associate_public_ip_address = bool
  })
  description = "ec2 instance configuration"
}
