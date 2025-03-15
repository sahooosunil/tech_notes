output "rapidoec2_public_ip_address" {
  value = "${aws_instance.rapidoec2.public_ip}"
  description = "rapido ec2 instance public ip address"
  sensitive = false
}