provider "aws" {
    region = "ap-northeast-1"
}

resource "aws_instance" "db" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
  depends_on = [
    aws_instance.db
  ]
}