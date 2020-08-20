# Terraform backend configuration
terraform {
  backend "s3" {}
}

module "simple_network" {
  source = "../../tf-modules/aws/network_simple"

  project_name      = var.project_name
  env               = var.env
  tags              = var.tags
  vpc_cidr_block    = var.vpc_cidr_block
  availability_zones = var.availability_zones
  subnet_newbits    = var.subnet_newbits
}