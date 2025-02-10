# codebuild_frontend

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
| [aws_codebuild_project.build_project](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codebuild_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | The codebulid project name | `string` | `"devops"` | no |
| <a name="input_codebuild_fontend_project_name"></a> [codebuild\_fontend\_project\_name](#input\_codebuild\_fontend\_project\_name) | The frontend codebulid project name | `string` | n/a | yes |
| <a name="input_github_token_name"></a> [github\_token\_name](#input\_github\_token\_name) | The name of GitHub Token | `string` | `"chatbot-github-app-token"` | no |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Region Name | `string` | n/a | yes |
| <a name="input_service_role_arn"></a> [service\_role\_arn](#input\_service\_role\_arn) | The service role arn variable. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontend_codebuild_id"></a> [frontend\_codebuild\_id](#output\_frontend\_codebuild\_id) | The Frontend CodeBuild Nanme |
<!-- END_TF_DOCS -->
