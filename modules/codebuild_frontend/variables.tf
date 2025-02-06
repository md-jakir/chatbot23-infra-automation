variable "service_role_arn" {
  type        = string
  description = "The service role arn variable."
}

variable "github_token_name" {
  type        = string
  description = "The name of GitHub Token"
  default = "chatbot-github-app-token"
}

# variable "random_name" {
#   default = random_pet.variable_name.id
# }

variable "codebuild_project_name" {
  type        = string
  description = "The frontend codebulid project name"
  default = "chatbot-frontend-proj"
}

variable "branch_name" {
  type        = string
  description = "The codebulid project name"
  default = "devops"
}

variable "log_stream_name" {
  type        = string
  description = "The codebulid project name"
  default = "chatbot-frontend-log-stream"
}

variable "log_group_name" {
  type        = string
  description = "The codebulid project name"
  default = "chatbot-fronted-log-group"
}