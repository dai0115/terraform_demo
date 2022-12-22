provider "aws" {
    region = "ap-northeast-1"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "dai_ec2" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
  count = var.number_of_servers
}