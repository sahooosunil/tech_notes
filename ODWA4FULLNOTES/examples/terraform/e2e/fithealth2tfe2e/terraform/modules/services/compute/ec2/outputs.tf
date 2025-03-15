output "ec2_private_ip" {
  value = aws_instance.fithealth2java.private_ip
}
output "ec2_instance_id" {
  value = aws_instance.fithealth2java.id
}
output "ec2_public_ip" {
  value = aws_instance.fithealth2java.public_ip
}