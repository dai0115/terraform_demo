provider "aws" {
  region = "ap-northeast-1"
}

module "db" {
  source = "./db"
  server_names = [ "mariadb", "mysql", "postgresql" ]
}

output "private_ips" {
  value = module.db.private_ip
}