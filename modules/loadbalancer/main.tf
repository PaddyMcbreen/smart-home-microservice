// Loadbalancer Setup:
resource "aws_lb" "loadbalancer" {
  name               = var.lb_name
  internal           = true
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.public_subnets_ids

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}