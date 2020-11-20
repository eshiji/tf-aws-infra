output "vpc_id" {
  value = module.network_challenge.vpc_id
}

output "private_subnets_ids" {
  value = module.network_challenge.private_subnets_ids
}

output "public_subnets_ids" {
  value = module.network_challenge.public_subnets_ids
}
