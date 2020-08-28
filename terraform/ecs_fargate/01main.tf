# Terraform backend configuration
terraform {
  backend "s3" {}
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = var.aws_s3_tfstate_storage_bucket_name
    key    = "${var.env}/network/${var.env}.tfstate"
    region = "us-east-1"
  }
}

module "ecs_fargate" {
  source = "../../../tf-modules/aws/ecs_fargate"

  project_name         = var.project_name
  env                  = var.env
  tags                 = var.tags
  vpc_id               = data.terraform_remote_state.network.outputs.vpc_id
  public_subnets_id    = data.terraform_remote_state.network.outputs.public_subnets_ids
  private_subnets_id   = data.terraform_remote_state.network.outputs.private_subnets_ids
  cidr_block_whitelist = var.cidr_block_whitelist
}


