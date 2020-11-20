# Terraform backend configuration
terraform {
  backend "s3" {}
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = var.aws_s3_tfstate_storage_bucket_name
    key    = "${var.env}/network/${var.env}.tfstate"
    region = var.aws_region
  }
}

module "ec2_infra" {
  source = "../../../tf-modules/aws/ec2_infra"

  project_name                                = var.project_name
  env                                         = var.env
  tags                                        = var.tags
  vpc_id                                      = data.terraform_remote_state.network.outputs.vpc_id
  public_subnet_ids                          = data.terraform_remote_state.network.outputs.public_subnets_ids
  cidr_block_whitelist                        = var.cidr_block_whitelist
  launch_template_delete_eni_on_termination   = var.launch_template_delete_eni_on_termination
  launch_template_associate_public_ip_address = var.launch_template_associate_public_ip_address
  # availability_zone_list                      = var.availability_zone_list
  launch_template_ebs_size                    = var.launch_template_ebs_size
  instance_type                               = var.instance_type
  asg_max_size = var.asg_max_size
  asg_min_size = var.asg_min_size
  asg_desired_capacity = var.asg_desired_capacity
}



