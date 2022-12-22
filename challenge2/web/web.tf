module "eip" {
  source = "../eip"
  instance_id = aws_instance.dai_web_server.id
}

module "sg" {
  source = "../sg"
}

resource "aws_instance" "dai_web_server" {
  ami = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"
  tags = {
    "Name" = "dai_web_server"
  }
    security_groups = [ module.sg.sg_name ]
  user_data = file("./web/server-script.sh")
}

