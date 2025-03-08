provider "aws" {
  region = "us-east-1"
}

module "network" {
  source          = "./modules/network"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}

module "instances" {
  source         = "./modules/instances"
  vpc_id        = module.network.vpc_id
  public_subnet = module.network.public_subnets[0]
  key_name      = module.security.key_name
  sg_id         = module.security.sg_id
}
