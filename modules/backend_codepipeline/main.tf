resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "${terraform.workspace}-${var.project_name}-pipeline-backend"
  tags = {
    Environment = terraform.workspace
    Name        = "BackendPipelineS3"
  }
}

resource "aws_codepipeline" "pipeline" {
  name           = "${terraform.workspace}-${var.pipeline_name}"
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
      name             = "${terraform.workspace}-${var.project_name}-backend-source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.codestart_connection_arn
        FullRepositoryId = "brainstationrandd/chatbot_boilerplate"
        BranchName       = var.source_branch_name
      }
    }
  }
  stage {
    name = "Build"
    action {
      name             = "${terraform.workspace}-${var.project_name}-backend-build"
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
      name            = "${terraform.workspace}-ECSBackendDeploy"
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
    Name        = "BackendCodePipeline"
  }
}

# resource "aws_codepipeline_webhook" "webhook" {
#   name            = "${var.pipeline_name}-webhook"
#   target_action   = "Source"
#   target_pipeline = aws_codepipeline.pipeline.name
#   filter {
#     json_path   = "$.ref"
#     match_equals = "refs/heads/${var.source_branch_name}"
#   }

#   authentication         = "UNAUTHENTICATED"
#   authentication_configuration {
#     none = true
#   }
# }
