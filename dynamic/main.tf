provider "aws" {
    region = "ap-northeast-1"
}

variable "ingressrules" {
  type = list(number)
  default = [80, 443]
}

variable "egressrules" {
  type = list(number)
  default = [80, 443, 25, 3306, 53, 8080]
}

resource "aws_instance" "dai_ec2" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  tags = {
    "Name" = "daiEc2"
  }
}

resource "aws_security_group" "webtraffic" {
  name        = "webtraffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
          from_port        = port.value
          to_port          = port.value
          protocol         = "tcp"
          cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
          from_port        = port.value
          to_port          = port.value
          protocol         = "tcp"
          cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "webtraffic"
  }
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.dai_ec2.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}