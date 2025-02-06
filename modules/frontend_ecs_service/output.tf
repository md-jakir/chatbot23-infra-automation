output "ecs_service_name" {
  description = "ECS Service Name"
  value       = aws_ecs_service.frontend_service.name
}