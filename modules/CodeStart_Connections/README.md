# CodeStart_Connections

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
| [aws_codestarconnections_connection.connection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codestarconnections_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codestart_connection"></a> [codestart\_connection](#input\_codestart\_connection) | CodeStart Connection Name | `string` | n/a | yes |
| <a name="input_type_provider"></a> [type\_provider](#input\_type\_provider) | Provider Type | `string` | `"GitHub"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_codestart_arn"></a> [codestart\_arn](#output\_codestart\_arn) | n/a |
<!-- END_TF_DOCS -->
