resource "aws_eip" "elasticip" {
  instance = var.instance_id
}