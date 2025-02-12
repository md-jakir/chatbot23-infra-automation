vpc_cidr                = "172.16.0.0/22"
public_subnet_cidrs     = ["172.16.0.0/24", "172.16.1.0/24"]
private_subnet_cidrs    = ["172.16.2.0/24", "172.16.3.0/24"]
availability_zones      = ["ap-south-1a", "ap-south-1b"]
private_ip_targets      = ["172.16.2.", "172.16.3."]
region_name             = "ap-south-1"
frontend_sg_prefix_name = "FrontendALBSG"
backend_sg_prefix_name  = "BackendALBSG"
app_frontend_sg         = "FrontendAppSG"
chatbot_frontend_alb    = "Chatbot23FrontendALB"
chatbot_backend_alb     = "Chatbot23BackendALB"
chatbot_frontend_tg     = "Chatbot23FrontendTG"
chatbot_backend_tg      = "Chatbot23BackendTG"
db_security_group       = "Chatbot23DBSecurityGroup"
cluster_name            = "chatbot23-ecs-cluster"
repository_names        = ["chatbot23-frontend", "chatbot23-backend"]
codestart_connection    = "Chatbot23Connection"
frontend = {
  image  = "905418236735.dkr.ecr.ap-south-1.amazonaws.com/prod-chatbot23-frontend:latest"
  cpu    = 256
  memory = 512
  port   = 80
}
backend = {
  image  = "905418236735.dkr.ecr.ap-south-1.amazonaws.com/prod-chatbot23-backend:latest"
  cpu    = 256
  memory = 512
  port   = 80
}
pipeline_name                  = "Chatbot23BackendPipeline"
codebuild_project_name         = "CodeBuildBackendProj"
codebuild_fontend_project_name = "CodebuildFrontendProj"
frontend_pipeline_name         = "Chatbot23FrontendPipeline"
public_alb_ingress_ports       = ["80", "443"]
public_alb_egress_ports        = ["0"]
internal_alb_egress_ports      = ["0"]
internal_alb_ingress_ports     = ["8000"]
