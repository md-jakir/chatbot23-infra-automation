resource "aws_ecs_task_definition" "frontend_task" {
  family                   = "${var.environment}-frontend-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.execution_role_arn
  cpu                      = var.frontend.cpu
  memory                   = var.frontend.memory
  container_definitions = templatefile("${path.module}/../../ecs-tasks-def/frontend-task-def.json", {
    nextauth_parameter_arn = var.nextauth_secret_arn
    frontend_service_discovery_name = var.frontend_discovery_name
    cluster_namespace_name = var.ecs_cluster_namespace
    backend_service_discovery_name = var.backend_discovery_name
  })
}
