provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
}

module "security" {
  source          = "./modules/security"
  vpc_id          = module.vpc.vpc_id
  key_name        = "m-key"
  public_key_path = "~/my-key.pub"
}

module "ec2" {
  source            = "./modules/ec2"
  instance_count    = 2
  ami               = data.aws_ami.ubuntu.id
  instance_type     = "t2.micro"
  subnet_ids        = module.vpc.public_subnet_ids
  key_name          = module.security.key_name
  security_group_id = module.security.security_group_id
  instance_names    = ["App-Machine", "Tools-Machine"]
}
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]  # Canonical's owner ID
}
