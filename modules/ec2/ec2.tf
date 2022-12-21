variable "ec2name" {
  type = string
}

resource "aws_instance" "dai_ec2" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
  tags = {
    "Name" = var.ec2name
  }
}

output "instance_id" {
  value = aws_instance.dai_ec2.id
}