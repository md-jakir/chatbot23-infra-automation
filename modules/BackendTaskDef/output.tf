output "backend_task_definition_arn" {
  description = "ARN of the backend ECS Task Definition"
  value       = aws_ecs_task_definition.backend_task.arn
}
