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

# VPC 
variable "vpc_cidr_block" {
}

variable "availability_zones" {
  type = list(string)
}

variable "subnet_newbits" {
  type = string
}