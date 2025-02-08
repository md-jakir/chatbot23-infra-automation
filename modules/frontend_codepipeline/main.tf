resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "${terraform.workspace}-${var.project_name}-pipeline-frontend"

  tags = {
    Environment = terraform.workspace
    Name        = "FrontendPipelineS3"
  }
}

resource "aws_codestarconnections_connection" "frontend_connection" {
  name          = "${terraform.workspace}-Chatbot23Connection"
  provider_type = "GitHub"
}

resource "aws_codepipeline" "pipeline" {
  name           = var.frontend_pipeline_name
  role_arn       = var.chatbot_codepipeline_role_arn
  pipeline_type  = "V2"
  execution_mode = "QUEUED"

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.codepipeline_bucket.bucket
  }

  stage {
    name = "Source"
    action {
      name             = "${terraform.workspace}-${var.project_name}-frontend-source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.codestart_connection_arn
        FullRepositoryId = "brainstationrandd/chatbot_admin_dashboard"
        BranchName       = var.source_branch_name
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "${terraform.workspace}-${var.project_name}-frontend-build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = var.build_project_name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "${terraform.workspace}-ECSFrontendDeploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      version         = "1"
      input_artifacts = ["build_output"]

      configuration = {
        ClusterName = var.ecs_cluster_name
        ServiceName = var.ecs_service_name
        FileName    = "imagedefinitions.json"
      }
    }
  }
  tags = {
    Environment = terraform.workspace
    Name        = "FrontendCodePipeline"
  }
}
