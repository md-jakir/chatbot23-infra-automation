variable "rds_instance_identifier" {
  description = "RDS instance identifier"
  type        = string
  default     = "chatbot23-db"
}

variable "rds_instance_class" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_engine" {
  description = "Database engine for RDS"
  type        = string
  default     = "postgres"
}

variable "rds_engine_version" {
  description = "Version of the database engine"
  type        = string
  default     = "16.3"
}

variable "rds_username" {
  description = "Master username for RDS"
  type        = string
  default     = "bs23"
}

variable "rds_password" {
  description = "Master password for RDS"
  type        = string
}

variable "rds_allocated_storage" {
  description = "Allocated storage for RDS in GB"
  type        = number
  default     = 200
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance"
  type        = list(string)
}

variable "db_security_group_ids" {
  description = "List of security group IDs for RDS"
  type        = list(string)
}
