output "public_ip" {
  value       = "${aws_instance.airtelcareec2.public_ip}"
  description = "ec2 instance public ip"
}
