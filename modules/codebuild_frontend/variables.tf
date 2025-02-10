variable "service_role_arn" {
  type        = string
  description = "The service role arn variable."
}

variable "github_token_name" {
  type        = string
  description = "The name of GitHub Token"
  default     = "chatbot-github-app-token"
}

variable "codebuild_fontend_project_name" {
  type        = string
  description = "The frontend codebulid project name"
}

variable "branch_name" {
  type        = string
  description = "The codebulid project name"
  default     = "devops"
}

variable "region_name" {
  description = "Region Name"
  type        = string
}
