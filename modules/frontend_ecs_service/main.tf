locals {
  frontend_discovery_name = "${terraform.workspace}-frontend-discovery"
  ecs_cluster_namespace   = "${terraform.workspace}-chatbot23-ecs-cluster-ns"
  #backend_discovery_name  = "${terraform.workspace}-backend-discovery"
  log_group_name = "/ecs/${terraform.workspace}-FrontendLogsGroup"
}

resource "aws_ecs_service" "frontend_service" {
  name                 = "${terraform.workspace}-FrontendService"
  cluster              = var.ecs_cluster_name
  task_definition      = var.frontend_taskdef_arn
  desired_count        = 1
  launch_type          = "FARGATE"
  force_new_deployment = true
  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }
  network_configuration {
    subnets         = var.private_subnets
    security_groups = var.frontend_security_groups
  }
  load_balancer {
    target_group_arn = var.internet_alb_tg
    container_name   = var.frontend_container
    container_port   = var.container_port
  }
  service_connect_configuration {
    enabled   = true
    namespace = local.ecs_cluster_namespace
    service {
      discovery_name = local.frontend_discovery_name
      port_name      = var.port_name_alias
      client_alias {
        dns_name = "${local.frontend_discovery_name}.${local.ecs_cluster_namespace}"
        port     = var.container_port
      }
    }
    log_configuration {
      log_driver = "awslogs"
      options = {
        awslogs-group         = local.log_group_name
        awslogs-region        = var.aws_region
        awslogs-stream-prefix = "ecs"
      }
    }
  }
  tags = {
    Environment = terraform.workspace
    Service     = "Frontend"
    projectName = var.project_name
  }
}
