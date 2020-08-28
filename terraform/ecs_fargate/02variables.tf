# Default variables
variable "project_name" {
  type = string
}

variable "env" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "aws_local_profile" {
  type        = string
  description = "The aws local profile with credentials from the target account to create the resources."
}

variable "aws_region" {
  type        = string
  description = "Region where the bucket will be created."
}

variable "aws_s3_tfstate_storage_bucket_name" {
  type = string
}

variable "cidr_block_whitelist" {
  type = list(string)
}
# Network vars will be used from terraform_remote_state

