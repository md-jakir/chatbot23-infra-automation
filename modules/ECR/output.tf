# modules/ecr/outputs.tf
output "repository_arns" {
  description = "ARNs of the created ECR repositories"
  value       = { for repo, resource in aws_ecr_repository.repositories : repo => resource.arn }
}

output "repository_urls" {
  description = "URLs of the created ECR repositories"
  value       = { for repo, resource in aws_ecr_repository.repositories : repo => resource.repository_url }
}
