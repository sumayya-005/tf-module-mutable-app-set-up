resource "aws_lb_target_group" "main" {
  name     = "${var.env}-${var.name}-tg"
  port     = var.app_port_no
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    enabled = true
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 5
    interval =  6
    path = "/health"
  }
}

resource "aws_lb_listener_rule" "rule" {
  count        = var.type == "backend" ? 1:0
  listener_arn = var.alb ["private"].lb_listener_arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }


  condition {
    host_header {
      values = ["${var.name}-${var.env}.roboshop.internal"]
    }
  }
}