provider "aws" {
    region = "ap-northeast-1"
}

module "db" {
  source = "./db"
}

module "web" {
  source = "./web"
}

output "web_pib" {
  value = module.db.private_ip
}