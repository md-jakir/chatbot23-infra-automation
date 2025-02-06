resource "aws_db_instance" "rds_instance" {
  identifier              = var.rds_instance_identifier
  instance_class          = var.rds_instance_class
  engine                  = var.rds_engine
  engine_version          = var.rds_engine_version
  username                = var.rds_username
  password                = var.rds_password
  allocated_storage       = var.rds_allocated_storage
  max_allocated_storage   = 500
  storage_type            = "gp3"
  publicly_accessible     = false
  vpc_security_group_ids  = var.db_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot     = true
  auto_minor_version_upgrade = true
  #manage_master_user_password = true
  backup_retention_period = 7
  deletion_protection = false
  storage_encrypted = true
  #monitoring_interval = 0

  tags = {
    Name        = "RDS Instance"
    Environment = "dev"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.rds_instance_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "RDS Subnet Group"
  }
}
