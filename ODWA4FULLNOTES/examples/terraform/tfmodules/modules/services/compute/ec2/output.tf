output "public_ip_address" {
  value = "${aws_instance.ec2instance.public_ip}"
}