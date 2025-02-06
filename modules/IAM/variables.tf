# variable "environment" {
#   description = "Environment (e.g., dev, staging, prod)"
#   type        = string
# }

variable "task_role_policies" {
  description = "List of managed policies for the ECS Task Role"
  type        = list(string)
  default     = []
}

# variable "execution_role_arn" {
#   description = "IAM role for ECS task execution"
#   type        = string
# }

