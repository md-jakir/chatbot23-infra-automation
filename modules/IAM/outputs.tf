output "execution_role_arn" {
  description = "ARN of the ECS Execution Role"
  value       = aws_iam_role.ecs_execution_role.arn
}

output "codebuild_role_arn" {
  description = "ARN of the codebuild Role"
  value       = aws_iam_role.codebuild_role.arn
}

output "task_role_arn" {
  description = "ARN of the ECS Task Role"
  value       = aws_iam_role.ecs_execution_role.arn
}

output "chatbot_codepipeline_role_arn" {
  description = "ARN of the ECS Task Role"
  value       = aws_iam_role.pipeline_role.arn
}

# output "bastion_host_role_arn" {
#   description = "ARN of the Bastion Host Role"
#   value       = aws_iam_role.bastion_host_role.arn
# }


