module "backend_config" {
  source = "git@github.com:eshiji/tf-modules.git//aws/tf-backend?ref=develop"

  tfstate_bucket_name = var.tfstate_bucket_name
  dynamodb_lock_table = var.dynamodb_lock_table
  aws_region          = var.aws_region
  tags                = var.tags
  #   artifact_bucket_name = "${var.artifact_bucket_name}"
}