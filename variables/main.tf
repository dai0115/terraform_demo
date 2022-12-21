provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "dai_test_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = var.mymap["vpcname"]
    }
}

variable "vpcname" {
  type = string
    default = "dai_test_vpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type = list(string)
  default = [ "value1", "value2", "value3" ]
}

variable "mymap" {
  type = map
  default = {
    vpcname = "dai_vpc"
    key2 = "value2"
  }
}

variable "mytuple" {
  type = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myobject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "dai"
    port = [ 22, 25, 80 ]
  }
}

output "dai_vpc_id" {
    value = aws_vpc.dai_test_vpc.id
}