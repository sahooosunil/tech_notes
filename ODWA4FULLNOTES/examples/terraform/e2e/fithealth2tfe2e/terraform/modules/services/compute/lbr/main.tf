resource "aws_elb" "fithealth2elb" {
  #availability_zones = var.availability_zones
  internal = false
  subnets            = var.lbr_subnet_ids
  security_groups    = [var.vpc_security_group_id]
  listener {
    instance_port     = var.instance_port
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = var.target
    interval            = 30
  }
  instances                   = var.ec2_instance_ids
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  tags = {
    "Name" = "fithealth2elb"
  }
}
