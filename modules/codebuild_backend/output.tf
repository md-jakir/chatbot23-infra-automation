output "backend_codebuild_id" {
  description = "The Frontend CodeBuild Nanme"
  value = aws_codebuild_project.build_project.id
}