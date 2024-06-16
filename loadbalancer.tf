resource "aws_lb" "test" {
  name               = var.load_balancer-name
  internal           = false
  load_balancer_type = var.elb-type
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = [aws_subnet.pub.id, aws_subnet.public.id]

  tags = {
    Environment = var.Environment
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = var.enduserport
  protocol          = var.tg_protocol


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
  provisioner "local-exec" {
    command = "start chrome http://${aws_lb.test.dns_name}:8000"
  }
}
output "alb_dns_name" {
  value = aws_lb.test.dns_name
}