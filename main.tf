module "aws_network" {
  source         = "./modules/aws/network"
  vpc_cidr      = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "aws_security" {
  source = "./modules/aws/security"
  vpc_id = module.aws_network.vpc_id
}

module "aws_instances" {
  source        = "./modules/aws/instances"
  public_subnet = module.aws_network.public_subnets[0]
  key_name      = module.aws_security.key_name
  sg_id         = module.aws_security.sg_id
}

module "azure_network" {
  source   = "./modules/azure/network"
  location = "East US"
}

module "azure_compute" {
  source    = "./modules/azure/compute"
  vnet_id   = module.azure_network.vnet_id
  subnet_id = module.azure_network.subnet_id
}
