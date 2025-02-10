# backend_codepipeline

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.86.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_codepipeline.pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codepipeline) | resource |
| [aws_s3_bucket.codepipeline_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_build_project_name"></a> [build\_project\_name](#input\_build\_project\_name) | CodeBuild project name | `string` | n/a | yes |
| <a name="input_chatbot_codepipeline_role_arn"></a> [chatbot\_codepipeline\_role\_arn](#input\_chatbot\_codepipeline\_role\_arn) | IAM Role ARN for CodePipeline | `string` | n/a | yes |
| <a name="input_codestart_connection_arn"></a> [codestart\_connection\_arn](#input\_codestart\_connection\_arn) | GitHub Connection ARN | `string` | n/a | yes |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | ECS Cluster Name | `string` | n/a | yes |
| <a name="input_ecs_service_name"></a> [ecs\_service\_name](#input\_ecs\_service\_name) | ECS Service Name | `string` | n/a | yes |
| <a name="input_pipeline_name"></a> [pipeline\_name](#input\_pipeline\_name) | Name of the CodePipeline | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The Projec Name | `string` | n/a | yes |
| <a name="input_source_branch_name"></a> [source\_branch\_name](#input\_source\_branch\_name) | Branch name of the repository to monitor | `string` | `"devops"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pipeline_id"></a> [pipeline\_id](#output\_pipeline\_id) | n/a |
<!-- END_TF_DOCS -->
