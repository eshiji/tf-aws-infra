# Bucket
output "static_content_bucket_id" {
  value = module.s3_cloudfront.static_content_bucket_id
}

output "static_content_bucket_domain_name" {
  value = module.s3_cloudfront.static_content_bucket_domain_name
}

# Cloudfront orifin identity access
output "cf_origin_access_identity_id" {
  value = module.s3_cloudfront.cf_origin_access_identity_id
}

# Cloudfront distribution
output "cf_distribution_id" {
  value = module.s3_cloudfront.cf_distribution_id
}

output "cf_distribution_domain_name" {
  value = module.s3_cloudfront.cf_distribution_domain_name
}

