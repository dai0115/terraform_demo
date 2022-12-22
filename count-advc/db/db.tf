resource "aws_instance" "db_server" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
  count = length(var.server_names)
  tags = {
    Name = var.server_names[count.index]
  }
}