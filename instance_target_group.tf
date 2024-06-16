
resource "aws_lb_target_group" "target" {
  name     = var.tg-name
  port     = var.target_port
  protocol = var.tg_protocol
  vpc_id   = aws_vpc.loadbalance.id

  health_check {
    path                = "/"
    interval            = 5
    timeout             = 4
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_target_group_attachment" "tgattach" {
  for_each = {
    "web_private"  = aws_instance.web_private,
    "web_private1" = aws_instance.web_private1
  }
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = each.value.id
  port             = var.target_port
}


