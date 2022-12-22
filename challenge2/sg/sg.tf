resource "aws_security_group" "webtraffic" {
  name        = "webtraffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.web_ports
    content {
    description      = "ingress sec group for web server."
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.web_ports
    content {
    description      = "egress sec group for web server."
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "sec_group"
  }
}