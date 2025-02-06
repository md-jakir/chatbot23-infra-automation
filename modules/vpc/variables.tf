variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
}

# variable "environment" {
#   description = "Environment name (e.g., dev, staging, production)"
#   type        = string
# }

# variable "nat_gateway_mapping" {
#   type = map(string)
#   default = {
#     "private_subnet_1_id" = "public_subnet_1_id"
#     "private_subnet_2_id" = "public_subnet_2_id"
#   }
# }

