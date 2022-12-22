resource "aws_instance" "db_server" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
  tags = {
    "Name" = "dai_db_server"
  }
}