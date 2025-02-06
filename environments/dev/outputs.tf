output "vpc_id" {
  value = module.vpc.vpc_id
}

output "instance_id" {
  value = module.compute.instance_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.terraform_lock.name
}
