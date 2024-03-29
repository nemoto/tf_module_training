terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.20.0"
    }
  }
}

provider "aws" {
  access_key = local.access_key
  secret_key = local.secret_key
  region     = local.region
  assume_role {
    role_arn = local.role_arn
  }
}

module "create_VPC" {
  source = "../../modules/vpc/"

  env      = local.env
  proj     = local.proj
  name     = "test"
  vpc_cidr = local.vpc_cidr
}

module "create_IGW" {
  source = "../../modules/igw/"

  env      = local.env
  proj     = local.proj
  name     = "test"
  vpc_id   = module.create_VPC.vpc_id
}

module "create_EIP_for_NAT_A" {
  source = "../../modules/eip/"

  env      = local.env
  proj     = local.proj
  name     = "test_subnet_A_NAT"
}

module "create_subnet_A" {
  source = "../../modules/subnet/"

  env      = local.env
  proj     = local.proj
  name     = "test"
  az       = "A"
  vpc_id   = module.create_VPC.vpc_id
  eip_id   = module.create_EIP_for_NAT_A.eip_id
  igw_id   = module.create_IGW.igw_id
  subnet_az = "ap-northeast-1a"
  subnet_private_cidr_for_public  = "10.0.0.0/24"
  subnet_private_cidr_for_private = "10.0.1.0/24"
}

module "create_EIP_for_NAT_C" {
  source = "../../modules/eip/"

  env      = local.env
  proj     = local.proj
  name     = "test_subnet_NAT"
}

module "create_subnet_C" {
  source = "../../modules/subnet/"

  env      = local.env
  proj     = local.proj
  name     = "test"
  az       = "C"
  vpc_id   = module.create_VPC.vpc_id
  eip_id   = module.create_EIP_for_NAT_C.eip_id
  igw_id   = module.create_IGW.igw_id
  subnet_az = "ap-northeast-1c"
  subnet_private_cidr_for_public  = "10.0.2.0/24"
  subnet_private_cidr_for_private = "10.0.3.0/24"
}

### Create EC2(bastion host) on public subnet

module "create_SG_bastion_server" {
  source = "../../modules/sg/"
  env      = local.env
  proj     = local.proj
  name     = "bastion"
  vpc_id   = module.create_VPC.vpc_id
}

module "create_SG_rules_ssh_for_bastion" {
  source                  = "../../modules/sg/ssh_bastion/"
  sg_id                   = module.create_SG_bastion_server.sg_id
  vpc_cidr                = local.vpc_cidr
  ssh_office_cidr         = var.ssh_office_cidr
  ssh_bastion_A_cidr      = var.ssh_bastion_A_cidr
  ssh_bastion_B_cidr      = var.ssh_bastion_B_cidr
  ssh_office_cidr_name    = var.ssh_office_cidr_name
  ssh_bastion_A_cidr_name = var.ssh_bastion_A_cidr_name
  ssh_bastion_B_cidr_name = var.ssh_bastion_B_cidr_name
}



module "create_EIP_for_EC2_bastion" {
  source = "../../modules/eip/"

  env      = local.env
  proj     = local.proj
  name     = "bation_EIP"
}

module "create_EC2_bastion" {
  source = "../../modules/ec2/ec2_eip/"

  env           = local.env
  proj          = local.proj
  name          = "bastion"
  az            = "A"
  private_ip    = "10.0.0.10"
  key_name      = local.key_name_bastion
  eip_id        = module.create_EIP_for_EC2_bastion.eip_id
  eip_public_ip = module.create_EIP_for_EC2_bastion.eip_public_ip
  subnet_id     = module.create_subnet_A.public_subnet_id
  sg_id         = module.create_SG_bastion_server.sg_id
}

### Create EC2(batch host) on private subnet

module "create_SG_batch_server" {
  source = "../../modules/sg/"
  env      = local.env
  proj     = local.proj
  name     = "batch"
  vpc_id   = module.create_VPC.vpc_id
}

module "create_SG_rules_ssh_for_batch" {
  source   = "../../modules/sg/ssh/"
  sg_id    = module.create_SG_batch_server.sg_id
  vpc_cidr = local.vpc_cidr
}

module "create_EC2_batch" {
  source = "../../modules/ec2/ec2_private/"

  env       = local.env
  proj      = local.proj
  name      = "batch"
  az        = "A"
  private_ip = "10.0.1.10"
  key_name  = local.key_name_batch
  subnet_id = module.create_subnet_A.private_subnet_id
  sg_id     = module.create_SG_batch_server.sg_id
}
