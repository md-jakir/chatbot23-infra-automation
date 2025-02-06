vpc_cidr = "172.16.0.0/22"
public_subnet_cidrs  = ["172.16.0.0/24", "172.16.1.0/24"]
private_subnet_cidrs = ["172.16.2.0/24", "172.16.3.0/24"]
availability_zones   = ["ap-south-1a", "ap-south-1b"]
private_ip_targets   = ["172.16.2.", "172.16.3."]
region_name = "ap-south-1"
frontend_sg_prefix_name = "frontend-alb-sg-"
backend_sg_prefix_name = "backend-alb-sg-"
app_frontend_sg = "frontend-app-sg-"
chatbot_frontend_alb = "chatbot23-frontend-alb"
chatbot_frontend_tg = "chatbot23-frontend-tg"
chatbot_backend_tg = "chatbot23-backend-tg"
db_security_group = "chatbot-db-security-group"
chatbot_backend_alb = "chatbot23-backend-alb"