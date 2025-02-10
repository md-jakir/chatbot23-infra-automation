# FrontendTaskDef

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
| [aws_ecs_task_definition.frontend_task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | IAM role for ECS task execution | `string` | n/a | yes |
| <a name="input_frontend"></a> [frontend](#input\_frontend) | Frontend container configuration | <pre>object({<br/>    image  = string<br/>    cpu    = number<br/>    memory = number<br/>    port   = number<br/>  })</pre> | n/a | yes |
| <a name="input_nextauth_secret_arn"></a> [nextauth\_secret\_arn](#input\_nextauth\_secret\_arn) | The ARN of the NEXTAUTH\_SECRET parameter from the parameter store. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The project Name | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | log group region | `string` | n/a | yes |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | IAM role for ECS task execution | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontend_task_definition_arn"></a> [frontend\_task\_definition\_arn](#output\_frontend\_task\_definition\_arn) | n/a |
<!-- END_TF_DOCS -->
