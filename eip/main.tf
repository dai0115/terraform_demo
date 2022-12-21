provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "dai_ec2" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
  tags = {
    "Name" = "daiEc2"
  }
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.dai_ec2.id
}

output "EIP" {
  value = aws_eip.elasticip.public_ip
}