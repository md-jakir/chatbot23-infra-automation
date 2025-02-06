variable "bastion_ami_id" {
  description = "EC2 AMI ID"
  type        = string
  default = "ami-0bd55ebedabddc3c0"
}

variable "bastion_subnet_id" {
  description = "Private Subnet IDs"
  type        = string
  #default = []
}

variable "instance_class" {
  description = "Instance Type"
  type        = string
  default = "t3.micro"
}

variable "bastion_host_role_arn" {
  description = "Private Subnet IDs"
  type        = string
  #default = []
}