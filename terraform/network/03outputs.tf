output "vpc_id" {
  value = module.simple_network.vpc_id
}

output "private_subnets_ids" {
  value = module.simple_network.private_subnets_ids
}

output "public_subnets_ids" {
  value = module.simple_network.public_subnets_ids
}
