locals {
  #frontend_discovery_name = "${terraform.workspace}-FrontendDiscovery"
  ecs_cluster_namespace  = "${terraform.workspace}-chatbot23-ecs-cluster-ns"
  backend_discovery_name = "${terraform.workspace}-backend-discovery"
  log_group_name         = "/ecs/${terraform.workspace}-BackendLogsGroup"
}

resource "aws_ecs_service" "backend_service" {
  name                 = "${terraform.workspace}-BackendService"
  cluster              = var.ecs_cluster_name
  task_definition      = var.backend_taskdef_arn
  desired_count        = 1
  launch_type          = "FARGATE"
  force_new_deployment = true
  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }
  network_configuration {
    subnets         = var.private_subnets
    security_groups = var.security_groups
  }
  load_balancer {
    target_group_arn = var.internal_alb_tg
    container_name   = var.backend_container
    container_port   = var.container_port
    #elb_name = var.internet_alb_name
  }

  service_connect_configuration {
    enabled   = true
    namespace = local.ecs_cluster_namespace
    service {
      discovery_name = local.backend_discovery_name
      port_name      = var.port_name_alias # This must match the port name defined in the task definition
      client_alias {
        dns_name = "${local.backend_discovery_name}.${local.ecs_cluster_namespace}"
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
    projectName = var.project_name
    Service     = "Backend"
  }
}
