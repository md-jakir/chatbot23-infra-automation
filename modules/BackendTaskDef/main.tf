resource "aws_ecs_task_definition" "backend_task" {
  family                   = "${var.environment}-backend-task"
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
    frontend_service_discovery_name = var.frontend_discovery_name
    cluster_namespace_name          = var.ecs_cluster_namespace
  })
}