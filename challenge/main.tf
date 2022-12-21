provider "aws" {
    region = "ap-northeast-1"
}

variable "web_ports" {
  type = list(number)
  default = [ 80, 443 ]
}

resource "aws_instance" "dai_db_server" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
  tags = {
    "Name" = "dai_db_server"
  }
}

resource "aws_instance" "dai_web_server" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
  tags = {
    "Name" = "dai_web_server"
  }
    security_groups = [ aws_security_group.webtraffic.name ]
  user_data = file("server-script.sh")
}

resource "aws_eip" "dai_elasticip" {
  instance = aws_instance.dai_web_server.id
}

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

output "db_server_private_ip" {
  value = aws_instance.dai_db_server.private_ip
}

