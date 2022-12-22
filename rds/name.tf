provider "aws" {
  region = var.region
}

resource "aws_db_instance" "myRDS" {
  db_name = "dai_test_rdb"
  identifier = "my-first-rds"
  instance_class = "db.t2.micro"
  engine = "mariadb"
  engine_version = "10.6.10"
  username = var.rds_username
  password = var.rds_password
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}