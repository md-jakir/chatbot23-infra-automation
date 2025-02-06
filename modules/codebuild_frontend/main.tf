resource "aws_codebuild_project" "build_project" {
  name          = var.codebuild_project_name
  service_role  = var.service_role_arn

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux-x86_64-standard:5.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = "ap-southeast-1"
    }
    environment_variable {
      name  = "REPOSITORY_URI"
      value = "905418236735.dkr.ecr.ap-southeast-1.amazonaws.com/dev-chatbot-frontend"
    }
  }
  logs_config {
    cloudwatch_logs {
      group_name  = var.log_group_name
      stream_name = var.log_stream_name
    }
  }
  source {
    type = "CODEPIPELINE"
  }
  artifacts {
    type = "CODEPIPELINE"
  }
  #buildspec = file("${path.module}/buildspec.yml")
}
