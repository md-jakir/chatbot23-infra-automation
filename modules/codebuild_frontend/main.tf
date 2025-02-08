locals {
  log_group_name = "${terraform.workspace}-CodeBuildFrontendLogGroup"
  log_stream_name = "${terraform.workspace}-CodeBuildFrontendLogStream"
}

resource "aws_codebuild_project" "build_project" {
  name          = "${terraform.workspace}-${var.codebuild_fontend_project_name}"
  service_role  = var.service_role_arn

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux-x86_64-standard:5.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.region_name
    }
    environment_variable {
      name  = "REPOSITORY_URI"
      value = "905418236735.dkr.ecr.ap-south-1.amazonaws.com/dev-chatbot23-frontend"
    }
  }
  logs_config {
    cloudwatch_logs {
      group_name  = local.log_group_name
      stream_name = local.log_stream_name
    }
  }
  source {
    type = "CODEPIPELINE"
  }
  artifacts {
    type = "CODEPIPELINE"
  }
  tags = {
    Environment = terraform.workspace
    Name = "FrontendCodeBuild"
  }
}
