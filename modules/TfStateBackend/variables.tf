variable "region_name" {
  description = "AWS region"
  type        = string
}

variable "tfstate_file_name" {
  description = "Terraform S3 Backend Name"
  type        = string
  default     = "chatbot23-tf-state-file"
}
