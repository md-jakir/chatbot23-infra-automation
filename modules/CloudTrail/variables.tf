variable "project_name" {
  description = "The name of the project (used for naming resources)."
  type        = string
  default = "chatbot23"
}

variable "region" {
  description = "AWS region to deploy the resources."
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
  description = "Environment for the resources (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "kms_key_id" {
  description = "The ARN of the KMS key for encrypting CloudTrail logs (optional). Leave blank if not using encryption."
  type        = string
  default     = ""
}
