# AWS provider Block
# provider "aws" {
#   region  = var.region_name
#   profile = "AI-chatbot-905418236735"
# }

# # Terraform provider Block
# terraform {
#   required_version = "~> 1.9.0"
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.85.0"
#     }
#   }
#   #backend "s3" {}
#   # bucket  = "dev-tf-state-file-ap-south-1"
#   # key     = "chatbot-app/${terraform.workspace}/terraform.tfstate"
#   # region  = "ap-south-1"
#   # encrypt = true
#   #dynamodb_table = "${var.project_name}-tf-locks"
# }

# Hasicorp vault provider Block
provider "vault" {
  #address = "https://127.0.0.1:8200"
  address          = "https://vault.example.com:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_secret_id
    }
  }
}

data "vault_kv_secret_v2" "chatbot23_kv" {
  mount = "chatbot23_secret"
  name  = "nextauth"
}

# VPC Module
module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

# ALB Module
module "alb" {
  source         = "./modules/ALB" # Path to your ALB module
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet_ids
  #private_subnets         = module.vpc.private_subnet_ids
  #vpc_cidr                = var.vpc_cidr
  #private_ip_targets      = var.private_ip_targets
  chatbot_frontend_tg        = var.chatbot_frontend_tg
  frontend_sg_prefix_name    = var.frontend_sg_prefix_name
  backend_sg_prefix_name     = var.backend_sg_prefix_name
  db_security_group          = var.db_security_group
  app_frontend_sg            = var.app_frontend_sg
  chatbot_frontend_alb       = var.chatbot_frontend_alb
  chatbot_backend_alb        = var.chatbot_backend_alb
  chatbot_backend_tg         = var.chatbot_backend_tg
  public_alb_egress_ports    = var.public_alb_egress_ports
  public_alb_ingress_ports   = var.public_alb_ingress_ports
  internal_alb_egress_ports  = var.internal_alb_egress_ports
  internal_alb_ingress_ports = var.internal_alb_ingress_ports
  depends_on                 = [module.vpc]
}

# ECS module start
module "ecs" {
  source       = "./modules/ECS"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  #private_subnets = module.vpc.private_subnet_ids
}

# ECR module start
module "ecr" {
  source           = "./modules/ECR"
  repository_names = var.repository_names
}

# IAM module
module "iam" {
  source = "./modules/IAM"
}

# Task Definition for Frontend
module "fronted_taskdef" {
  source              = "./modules/FrontendTaskDef"
  frontend            = var.frontend
  execution_role_arn  = module.iam.execution_role_arn
  nextauth_secret_arn = module.parameter_store.nextauth_secret_arn
  task_role_arn       = module.iam.task_role_arn
  project_name        = var.project_name
  region              = var.region_name
  depends_on = [
    module.ecs,
    module.iam,
    module.parameter_store

  ]
}

# Task Definition for Backend
module "backend_taskdef" {
  source                    = "./modules/BackendTaskDef"
  backend                   = var.backend
  execution_role_arn        = module.iam.execution_role_arn
  db_url_arn                = module.parameter_store.db_url_arn
  jwt_secret_arn            = module.parameter_store.jwt_secret_arn
  jwt_secret_for_verify_arn = module.parameter_store.jwt_secret_for_verify_arn
  openai_api_key_arn        = module.parameter_store.openai_api_key_arn
  sender_password_arn       = module.parameter_store.secret_key_arn
  secret_key_arn            = module.parameter_store.secret_key_arn
  session_token_arn         = module.parameter_store.session_token_arn
  access_key_arn            = module.parameter_store.access_key_arn
  #task_role_arn             = module.iam.task_role_arn
  project_name = var.project_name
  depends_on = [
    module.parameter_store,
    module.iam,
    module.ecs
  ]
}

# Parameter Stotre module
module "parameter_store" {
  source                = "./modules/parameter_store"
  nextauth_secret       = data.vault_kv_secret_v2.chatbot23_kv.data["nextauth_secret"]
  db_url                = data.vault_kv_secret_v2.chatbot23_kv.data["DBUrl"]
  jwt_secret            = data.vault_kv_secret_v2.chatbot23_kv.data["jwt_secret"]
  secret_key            = data.vault_kv_secret_v2.chatbot23_kv.data["secret_key"]
  openai_api_key        = data.vault_kv_secret_v2.chatbot23_kv.data["openai_api_key"]
  session_token         = data.vault_kv_secret_v2.chatbot23_kv.data["session_token"]
  sender_password       = data.vault_kv_secret_v2.chatbot23_kv.data["sender_password"]
  jwt_secret_for_verify = data.vault_kv_secret_v2.chatbot23_kv.data["jwt_secret_for_verify"]
  access_key            = data.vault_kv_secret_v2.chatbot23_kv.data["access_key"]
}

# CodeBuild Module for Frontend
module "frontend_codebuild" {
  source                         = "./modules/codebuild_frontend"
  service_role_arn               = module.iam.codebuild_role_arn
  codebuild_fontend_project_name = var.codebuild_fontend_project_name
  region_name                    = var.region_name
}

# CodeBuild Module for Backend
module "backend_codebuild" {
  source                 = "./modules/codebuild_backend"
  service_role_arn       = module.iam.codebuild_role_arn
  codebuild_project_name = var.codebuild_project_name
  region_name            = var.region_name
  depends_on             = [module.iam]
}

# ECS Service for Frontend
module "ecs_service_frontend" {
  source               = "./modules/frontend_ecs_service"
  frontend_taskdef_arn = module.fronted_taskdef.frontend_task_definition_arn
  private_subnets      = module.vpc.private_subnet_ids
  #internet_alb_name        = module.ALB.internet_alb_arn
  internet_alb_tg          = module.alb.internet_alb_tg_arn
  ecs_cluster_name         = module.ecs.cluster_arn
  frontend_security_groups = [module.alb.frontend_security_group]
  aws_region               = var.region_name
  project_name             = var.project_name
  depends_on = [
    module.alb,
    module.ecs,
    module.vpc,
    module.fronted_taskdef
  ]
}

# ECS Service for Backend
module "ecs_service_backend" {
  source              = "./modules/backend_ecs_service"
  backend_taskdef_arn = module.backend_taskdef.backend_task_definition_arn
  private_subnets     = module.vpc.private_subnet_ids
  #internal_alb_name   = module.ALB.internal_alb_arn
  internal_alb_tg  = module.alb.internal_alb_tg_arn
  security_groups  = [module.alb.internal_security_group_id]
  ecs_cluster_name = module.ecs.cluster_arn
  aws_region       = var.region_name
  project_name     = var.project_name
  depends_on = [
    module.alb,
    module.vpc,
    module.ecs,
    module.backend_taskdef
  ]
}

# Frontend CodePipeline Module
module "chatbot_codepipeline" {
  source                        = "./modules/frontend_codepipeline"
  ecs_cluster_name              = module.ecs.cluster_arn
  chatbot_codepipeline_role_arn = module.iam.chatbot_codepipeline_role_arn
  ecs_service_name              = module.ecs_service_frontend.ecs_service_name
  build_project_name            = module.frontend_codebuild.frontend_codebuild_id
  codestart_connection_arn      = module.codestart_connection_github.codestart_arn
  project_name                  = var.project_name
  frontend_pipeline_name        = var.frontend_pipeline_name
}

# CodeStart Connection Module
module "codestart_connection_github" {
  source               = "./modules/CodeStart_Connections"
  codestart_connection = var.codestart_connection
}

# Backend CodePipeline Module
module "chatbot_backend_codepipeline" {
  source                        = "./modules/backend_codepipeline"
  ecs_cluster_name              = module.ecs.cluster_arn
  chatbot_codepipeline_role_arn = module.iam.chatbot_codepipeline_role_arn
  ecs_service_name              = module.ecs_service_backend.ecs_service_name
  build_project_name            = module.backend_codebuild.backend_codebuild_id
  codestart_connection_arn      = module.codestart_connection_github.codestart_arn
  project_name                  = var.project_name
  pipeline_name                 = var.pipeline_name
  depends_on = [
    module.iam,
    module.ecs,
    module.ecs_service_backend,
    module.backend_codebuild
  ]
}

module "cloudtrail" {
  source       = "./modules/CloudTrail"
  project_name = var.project_name
  #region       = var.region_name
}

module "config" {
  source       = "./modules/AWSConfig"
  project_name = var.project_name
}

# TF State file in S3
module "tf_state_backend_s3" {
  source      = "./modules/TfStateBackend"
  region_name = var.region_name
}
