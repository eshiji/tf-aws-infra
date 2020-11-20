# Common
variable "project_name" {
  type = string
}
variable "env" {
  type    = string
  default = "dev"
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
variable "instance_type" {
    type = string
}

# Launch template and ASG
variable "launch_template_ebs_size" {
  type    = number
  default = 8
}
# variable "availability_zone_list" {
#   type = string
# }
# variable "ami_id" {
#   type = string
# }
variable "launch_template_associate_public_ip_address" {
  type    = bool
  default = true
}
variable "launch_template_delete_eni_on_termination" {
  type    = bool
  default = true
}
variable "cidr_block_whitelist" {
  type = list(string)
}
variable "asg_max_size" {
    type = number
}
variable "asg_min_size" {
    type = number
}
variable "asg_desired_capacity" {
    type = number
}