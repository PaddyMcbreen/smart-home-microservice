// Load-balancer Setup:
resource "aws_lb" "loadbalancer" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.public_subnets_ids

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

// Load-Balancer Target Groups:
resource "aws_lb_target_group" "lb_targetGroups" {
  count = var.num_targetGroups

  name = "${element(["lighting", "heating", "status"], count.index)}-tg"
  port = 3000
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

// Load-balance Listner Setup:
resource "aws_lb_listener" "lb_listner" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_targetGroups[0].arn
  }

  tags = {
    Name = var.lb_listner_name
  }
}


// Load-Balancer Listner Rule - Heating
resource "aws_lb_listener_rule" "heating_rule" {

  listener_arn = aws_lb_listener.lb_listner.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_targetGroups[1].arn
  }

  condition {
    path_pattern {
      values = ["/api/heating"]
    }
  }
}


// Load-Balancer Listner Rule - Status
resource "aws_lb_listener_rule" "status_rule" {

  listener_arn = aws_lb_listener.lb_listner.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_targetGroups[2].arn
  }

  condition {
    path_pattern {
      values = ["/api/status"]
    }
  }
}
