# Terraform backend configuration
terraform {
  backend "s3" {}
}

module "s3_cloudfront" {
  source = "../../../tf-modules/aws/s3_cloudfront"

  project_name       = var.project_name
  env                = var.env
  tags               = var.tags
  
  static_content_bucket_name = var.static_content_bucket_name
  default_root_object = var.default_root_object
}