provider "aws" {
    region = "ap-northeast-1"
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

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
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