# modules/ecr/variables.tf
variable "repository_names" {
  description = "List of repository names to create"
  type        = list(string)
}

variable "environment" {
  description = "Environment (e.g., dev, staging, prod)"
  type        = string
}
