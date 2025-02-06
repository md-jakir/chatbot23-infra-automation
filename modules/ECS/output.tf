# modules/ecs_cluster/outputs.tf
output "cluster_arn" {
  value = aws_ecs_cluster.ecs_cluster.arn
}

output "namespace_id" {
  value = aws_service_discovery_private_dns_namespace.namespace.id
}
