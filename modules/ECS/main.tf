# modules/ecs_cluster/main.tf
resource "aws_service_discovery_private_dns_namespace" "namespace" {
  name        = "${var.cluster_name}-namespace"
  description = "Private DNS namespace for ECS service discovery"
  vpc         = var.vpc_id

  tags = {
    Environment = var.environment
  }
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
  tags = {
    Environment = var.environment
  }
  service_connect_defaults {
    namespace = aws_service_discovery_private_dns_namespace.namespace.arn
  }
}

# Output for the ECS cluster ARN and Name
# output "cluster_arn" {
#   value = aws_ecs_cluster.ecs_cluster.arn
# }

# output "cluster_name" {
#   value = aws_ecs_cluster.ecs_cluster.name
# }
