resource "aws_ecr_repository" "repositories" {
  for_each = toset(var.repository_names)

  name                 = "${terraform.workspace}-${each.key}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "${terraform.workspace}"
  }
}

