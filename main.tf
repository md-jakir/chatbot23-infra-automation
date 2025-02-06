provider "aws" {
  region = var.region_name
  profile = "AI-chatbot-905418236735"
}

# TF State Backend for DEV in S3
# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "~>5.85.0"
#     }
#   }
#   backend "s3" {}
#     # bucket  = "dev-tf-state-file-ap-south-1"
#     # key     = "chatbot-app/${terraform.workspace}/terraform.tfstate"
#     # region  = "ap-south-1"
#     # encrypt = true
#     #dynamodb_table = "${var.project_name}-tf-locks"
# }

# VPC Module
module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  #environment          = var.environment
}

# ALB Module
module "ALB" {
  source             = "./modules/ALB" # Path to your ALB module
  vpc_id             = module.vpc.vpc_id
  public_subnets     = module.vpc.public_subnet_ids
  private_subnets    = module.vpc.private_subnet_ids
  vpc_cidr           = var.vpc_cidr
  private_ip_targets = var.private_ip_targets
  chatbot_frontend_tg = var.chatbot_frontend_tg
  frontend_sg_prefix_name = var.frontend_sg_prefix_name
  backend_sg_prefix_name = var.backend_sg_prefix_name
  db_security_group = var.db_security_group
  app_frontend_sg = var.app_frontend_sg
  chatbot_frontend_alb = var.chatbot_frontend_alb
  chatbot_backend_alb = var.chatbot_backend_alb
  chatbot_backend_tg = var.chatbot_backend_tg
}

# ECS module start
# module "ECS" {
#   source          = "./modules/ECS"
#   cluster_name    = var.cluster_name
#   vpc_id          = module.vpc.vpc_id
#   private_subnets = module.vpc.private_subnet_ids
#   environment     = var.environment
# }

# ECR module start
# module "ecr" {
#   source           = "./modules/ECR"
#   repository_names = var.repository_names
#   environment      = var.environment
# }

# IAM module
module "iam" {
  source      = "./modules/IAM"
  #environment = var.environment
}

# Task Definition for Frontend
# module "fronted_taskdef" {
#   source              = "./modules/FrontendTaskDef"
#   environment         = var.environment
#   frontend            = var.frontend
#   execution_role_arn  = module.iam.execution_role_arn
#   nextauth_secret_arn = module.parameter_store.nextauth_secret_arn
#   task_role_arn       = module.iam.task_role_arn
# }

# Task Definition for Backend
# module "backend_taskdef" {
#   source                    = "./modules/BackendTaskDef"
#   environment               = var.environment
#   backend                   = var.backend
#   execution_role_arn        = module.iam.execution_role_arn
#   db_url_arn                = module.parameter_store.db_url_arn
#   jwt_secret_arn            = module.parameter_store.jwt_secret_arn
#   jwt_secret_for_verify_arn = module.parameter_store.jwt_secret_for_verify_arn
#   openai_api_key_arn        = module.parameter_store.openai_api_key_arn
#   sender_password_arn       = module.parameter_store.secret_key_arn
#   secret_key_arn            = module.parameter_store.secret_key_arn
#   session_token_arn         = module.parameter_store.session_token_arn
#   access_key_arn            = module.parameter_store.access_key_arn
#   task_role_arn             = module.iam.task_role_arn
#   #depends_on = [ module.parameter_store ]
# }

# Parameter Stotre module
# module "parameter_store" {
#   source                = "./modules/parameter_store"
#   nextauth_secret       = var.nextauth_secret
#   db_url                = var.db_url
#   jwt_secret            = var.jwt_secret
#   secret_key            = var.secret_key
#   openai_api_key        = var.openai_api_key
#   session_token         = var.session_token
#   sender_password       = var.sender_password
#   jwt_secret_for_verify = var.jwt_secret_for_verify
#   access_key            = var.access_key
# }

# CodeBuild Module for Frontend
# module "frontend_codebuild" {
#   source           = "./modules/codebuild_frontend"
#   service_role_arn = module.iam.codebuild_role_arn
# }

# CodeBuild Module for Backend
# module "backend_codebuild" {
#   source           = "./modules/codebuild_backend"
#   service_role_arn = module.iam.codebuild_role_arn
# }

# ECS Service for Frontend
# module "ecs_service_frontend" {
#   source                   = "./modules/frontend_ecs_service"
#   frontend_taskdef_arn     = module.fronted_taskdef.frontend_task_definition_arn
#   environment              = var.environment
#   private_subnets          = module.vpc.private_subnet_ids
#   internet_alb_name        = module.ALB.internet_alb_arn
#   internet_alb_tg          = module.ALB.internet_alb_tg_arn
#   ecs_cluster_name         = module.ECS.cluster_arn
#   frontend_security_groups = [module.ALB.frontend_security_group]
# }

# ECS Service for Backend
# module "ecs_service_backend" {
#   source              = "./modules/backend_ecs_service"
#   backend_taskdef_arn = module.backend_taskdef.backend_task_definition_arn
#   environment         = var.environment
#   private_subnets     = module.vpc.private_subnet_ids
#   internal_alb_name   = module.ALB.internal_alb_arn
#   internal_alb_tg     = module.ALB.internal_alb_tg_arn
#   security_groups     = [module.ALB.internal_security_group_id]
#   ecs_cluster_name    = module.ECS.cluster_arn
# }

# Frontend CodePipeline Module
# module "chatbot_codepipeline" {
#   source                        = "./modules/frontend_codepipeline"
#   ecs_cluster_name              = module.ECS.cluster_arn
#   chatbot_codepipeline_role_arn = module.iam.chatbot_codepipeline_role_arn
#   ecs_service_name              = module.ecs_service_frontend.ecs_service_name
#   build_project_name            = module.frontend_codebuild.frontend_codebuild_id
#   codestart_connection_arn      = module.codestart_connection_github.codestart_arn
# }

# CodeStart Connection Module
# module "codestart_connection_github" {
#   source = "./modules/CodeStart_Connections"
# }

# Backend CodePipeline Module
# module "chatbot_backend_codepipeline" {
#   source                        = "./modules/backend_codepipeline"
#   ecs_cluster_name              = module.ECS.cluster_arn
#   chatbot_codepipeline_role_arn = module.iam.chatbot_codepipeline_role_arn
#   ecs_service_name              = module.ecs_service_backend.ecs_service_name
#   build_project_name            = module.backend_codebuild.backend_codebuild_id
#   codestart_connection_arn      = module.codestart_connection_github.codestart_arn
# }

# module "rds" {
#   source = "./modules/RDS"
#   db_security_group_ids = [module.ALB.db_security_group_ids]
#   subnet_ids = module.vpc.private_subnet_ids
# }

# module "bastion_host" {
#   source = "./modules/BastionHost"
#   bastion_host_role_arn = module.iam.bastion_host_role_arn
#   bastion_subnet_id = module.vpc.private_subnet_ids[0]
# }

# module "cloudtrail" {
#   source = "./modules/CloudTrail"
# }

# module "config" {
#   source = "./modules/AWSConfig"
# }

# TF State file in S3
module "TfStateBackendS3" {
  source = "./modules/TfStateBackend"
  region_name = var.region_name
}