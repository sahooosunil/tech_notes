vpc_cidr="10.1.0.0/16"
subnet1_cidr = "10.1.1.0/24"
ec2instanceconfig = {
  instance_type = "t2.micro"
  ami = "ami-03f4878755434977f"
  associate_public_ip = true
}