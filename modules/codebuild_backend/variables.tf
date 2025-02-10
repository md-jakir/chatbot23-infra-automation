variable "service_role_arn" {
  type        = string
  description = "The service role arn variable."
}

variable "codebuild_project_name" {
  type        = string
  description = "The backend codebulid project name"
}

# variable "branch_name" {
#   type        = string
#   description = "The codebulid project name"
#   default     = "devops"
# }

variable "region_name" {
  description = "Region Name"
  type        = string
}
