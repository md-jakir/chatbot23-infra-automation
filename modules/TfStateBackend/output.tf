output "terraform_state_s3_id" {
  description = "TF State Backend S3 Name"
  value       = aws_s3_bucket.terraform_state.id
}