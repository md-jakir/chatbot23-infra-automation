# BackendTaskDef

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
| [aws_ecs_task_definition.backend_task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key_arn"></a> [access\_key\_arn](#input\_access\_key\_arn) | The ARN of the Access Key parameter from the parameter store. | `string` | n/a | yes |
| <a name="input_backend"></a> [backend](#input\_backend) | Backend container configuration | <pre>object({<br/>    image  = string<br/>    cpu    = number<br/>    memory = number<br/>    port   = number<br/>  })</pre> | n/a | yes |
| <a name="input_db_url_arn"></a> [db\_url\_arn](#input\_db\_url\_arn) | The ARN of the NEXTAUTH\_SECRET parameter from the parameter store. | `string` | n/a | yes |
| <a name="input_execution_role_arn"></a> [execution\_role\_arn](#input\_execution\_role\_arn) | IAM role for ECS task execution | `string` | n/a | yes |
| <a name="input_jwt_secret_arn"></a> [jwt\_secret\_arn](#input\_jwt\_secret\_arn) | The ARN of the JWT SECRET parameter from the parameter store. | `string` | n/a | yes |
| <a name="input_jwt_secret_for_verify_arn"></a> [jwt\_secret\_for\_verify\_arn](#input\_jwt\_secret\_for\_verify\_arn) | The ARN of the JWT SECRET verify parameter from the parameter store. | `string` | n/a | yes |
| <a name="input_openai_api_key_arn"></a> [openai\_api\_key\_arn](#input\_openai\_api\_key\_arn) | The ARN of the OpenAi API Key parameter from the parameter store. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The Project Name | `string` | n/a | yes |
| <a name="input_secret_key_arn"></a> [secret\_key\_arn](#input\_secret\_key\_arn) | The ARN of the Secret Key parameter from the parameter store. | `string` | n/a | yes |
| <a name="input_sender_password_arn"></a> [sender\_password\_arn](#input\_sender\_password\_arn) | The ARN of the Sencer Password parameter from the parameter store. | `string` | n/a | yes |
| <a name="input_session_token_arn"></a> [session\_token\_arn](#input\_session\_token\_arn) | The ARN of the Secret Key parameter from the parameter store. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_task_definition_arn"></a> [backend\_task\_definition\_arn](#output\_backend\_task\_definition\_arn) | ARN of the backend ECS Task Definition |
<!-- END_TF_DOCS -->
