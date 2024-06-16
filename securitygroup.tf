resource "aws_security_group" "allow_tls" {
  name        = "allow-load-traffic"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.loadbalance.id
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value

    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

