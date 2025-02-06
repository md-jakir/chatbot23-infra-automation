# modules/ecr/main.tf
resource "aws_ecr_repository" "repositories" {
  for_each = toset(var.repository_names)

  name = "${var.environment}-${each.key}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = var.environment
    Name        = each.key
  }
}

# # Outputs for repository details
# output "repository_arns" {
#   value = { for repo, resource in aws_ecr_repository.repositories : repo => resource.arn }
# }

# output "repository_urls" {
#   value = { for repo, resource in aws_ecr_repository.repositories : repo => resource.repository_url }
# }
