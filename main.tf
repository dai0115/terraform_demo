provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "dai_test_vpc" {
    cidr_block = "10.0.0.0/16"
}