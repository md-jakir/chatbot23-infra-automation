resource "aws_ecs_service" "frontend_service" {
  name            = "frontend-service"
  cluster         = var.ecs_cluster_name
  task_definition = var.frontend_taskdef_arn
  desired_count   = 1
  launch_type     = "FARGATE"
  force_new_deployment = true
  deployment_circuit_breaker {
    enable = true
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
    #elb_name = var.internet_alb_name
  }

  service_connect_configuration {
    enabled = true
    namespace = var.cluster_namespace 
    service {
      discovery_name = var.frontend_discovery
      port_name = var.port_name_alias # This must match the port name defined in the task definition
      client_alias {
        dns_name = "${var.frontend_discovery}.${var.cluster_namespace}"
        port = var.container_port
      }
    }

    log_configuration {
      log_driver = "awslogs"
      options = {
        awslogs-group         = "/ecs/admin-dashboard-dev"
        awslogs-region        = var.aws_region
        awslogs-stream-prefix = "ecs"
      }
    }
  }

  tags = {
    Environment = var.environment
  }
}
