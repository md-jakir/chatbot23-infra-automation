locals {
  frontend_discovery_name = "${terraform.workspace}-frontend-discovery"
  ecs_cluster_namespace = "${terraform.workspace}-chatbot23-ecs-cluster-ns"
  backend_discovery_name = "${terraform.workspace}-backend-discovery"
  log_group_name = "/ecs/${terraform.workspace}-BackendLogsGroup"
}

resource "aws_ecs_task_definition" "backend_task" {
  family                   = "${terraform.workspace}-BackendTask"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.execution_role_arn
  cpu                      = var.backend.cpu
  memory                   = var.backend.memory
  container_definitions = templatefile("${path.module}/../../ecs-tasks-def/backend-task-def.json", {
    db_url_parameter_arn            = var.db_url_arn
    jwt_secret_parameter_arn        = var.jwt_secret_arn
    jwt_secret_verify_parameter_arn = var.jwt_secret_for_verify_arn
    openai_api_key_parameter_arn    = var.openai_api_key_arn
    sender_password_parameter_arn   = var.sender_password_arn
    secret_key_parameter_arn        = var.secret_key_arn
    session_token_parameter_arn     = var.session_token_arn
    access_key_parameter_arn        = var.access_key_arn
    frontend_service_discovery_name = local.frontend_discovery_name
    cluster_namespace_name          = local.ecs_cluster_namespace
    log_group_name                  = local.log_group_name
  })
    tags = {
      Environment = "${terraform.workspace}"
      projectName = var.project_name
      ServiceName = "Backend"
    }
}