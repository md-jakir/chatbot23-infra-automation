variable "project_name" {
  description = "The name of the project (used for naming resources)."
  type        = string
}

# variable "region" {
#   description = "AWS region to deploy the resources."
#   type        = string
# }

variable "kms_key_id" {
  description = "The ARN of the KMS key for encrypting CloudTrail logs (optional). Leave blank if not using encryption."
  type        = string
  default     = ""
}
