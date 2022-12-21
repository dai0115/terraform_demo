provider "aws" {
  region = "ap-northeast-1"
}

module "ec2module" {
  source = "./ec2"
  ec2name = "Name for Module"
}

output "module_output" {
  value = module.ec2module.instance_id
}