resource "aws_service_discovery_private_dns_namespace" "namespace" {
  name        = "${terraform.workspace}-${var.cluster_name}-ns"
  description = "Private DNS namespace for ECS service discovery"
  vpc         = var.vpc_id

  tags = {
    Environment = "${terraform.workspace}"
  }
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${terraform.workspace}-${var.cluster_name}"
  tags = {
    Environment = "${terraform.workspace}"
  }
  service_connect_defaults {
    namespace = aws_service_discovery_private_dns_namespace.namespace.arn
  }
}
