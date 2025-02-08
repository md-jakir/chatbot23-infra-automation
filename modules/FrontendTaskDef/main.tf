locals {
  frontend_discovery_name = "${terraform.workspace}-frontend-discovery"
  ecs_cluster_namespace = "${terraform.workspace}-chatbot23-ecs-cluster-ns"
  backend_discovery_name = "${terraform.workspace}-backend-discovery"
  log_group_name = "/ecs/${terraform.workspace}-FrontendLogsGroup"
}


  resource "aws_ecs_task_definition" "frontend_task" {
    family                   = "${terraform.workspace}-FrontendTask"
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    execution_role_arn       = var.execution_role_arn
    task_role_arn            = var.execution_role_arn
    cpu                      = var.frontend.cpu
    memory                   = var.frontend.memory
    container_definitions = templatefile("${path.module}/../../ecs-tasks-def/frontend-task-def.json", {
      nextauth_parameter_arn = var.nextauth_secret_arn
      frontend_service_discovery_name = local.frontend_discovery_name
      cluster_namespace_name = local.ecs_cluster_namespace
      backend_service_discovery_name = local.backend_discovery_name
      log_group_name = local.log_group_name
    })
    tags = {
      Environment = "${terraform.workspace}"
      projectName = var.project_name
      ServiceName = "Frontend"
    }
  }
