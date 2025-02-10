# parameter_store

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
| [aws_ssm_parameter.access_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.db_url](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.jwt_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.jwt_secret_for_verify](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.nextauth_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.openai_api_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.secret_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.sender_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.session_token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | Access key | `string` | n/a | yes |
| <a name="input_db_url"></a> [db\_url](#input\_db\_url) | Database URL | `string` | n/a | yes |
| <a name="input_jwt_secret"></a> [jwt\_secret](#input\_jwt\_secret) | JWT secret | `string` | n/a | yes |
| <a name="input_jwt_secret_for_verify"></a> [jwt\_secret\_for\_verify](#input\_jwt\_secret\_for\_verify) | JWT secret for verify | `string` | n/a | yes |
| <a name="input_nextauth_secret"></a> [nextauth\_secret](#input\_nextauth\_secret) | NextAuth secret value | `string` | n/a | yes |
| <a name="input_openai_api_key"></a> [openai\_api\_key](#input\_openai\_api\_key) | OpenAI API key | `string` | n/a | yes |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | Secret key | `string` | n/a | yes |
| <a name="input_sender_password"></a> [sender\_password](#input\_sender\_password) | Sender Password | `string` | n/a | yes |
| <a name="input_session_token"></a> [session\_token](#input\_session\_token) | Session token | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key_arn"></a> [access\_key\_arn](#output\_access\_key\_arn) | The ARN of the Access key parameter |
| <a name="output_db_url_arn"></a> [db\_url\_arn](#output\_db\_url\_arn) | The ARN of the database URL parameter |
| <a name="output_jwt_secret_arn"></a> [jwt\_secret\_arn](#output\_jwt\_secret\_arn) | The ARN of the JWT secret parameter |
| <a name="output_jwt_secret_for_verify_arn"></a> [jwt\_secret\_for\_verify\_arn](#output\_jwt\_secret\_for\_verify\_arn) | The ARN of the JWT secret for verify parameter |
| <a name="output_nextauth_secret_arn"></a> [nextauth\_secret\_arn](#output\_nextauth\_secret\_arn) | The ARN of the nextauth secret parameter |
| <a name="output_openai_api_key_arn"></a> [openai\_api\_key\_arn](#output\_openai\_api\_key\_arn) | The ARN of the OpenAI API key parameter |
| <a name="output_secret_key_arn"></a> [secret\_key\_arn](#output\_secret\_key\_arn) | The ARN of the Secret Key parameter |
| <a name="output_sender_password_arn"></a> [sender\_password\_arn](#output\_sender\_password\_arn) | The ARN of the Sender Password parameter |
| <a name="output_session_token_arn"></a> [session\_token\_arn](#output\_session\_token\_arn) | The ARN of the Session Token parameter |
<!-- END_TF_DOCS -->
