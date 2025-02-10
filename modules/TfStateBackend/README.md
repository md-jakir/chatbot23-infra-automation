# TfStateBackend

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
| [aws_s3_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | AWS region | `string` | n/a | yes |
| <a name="input_tfstate_file_name"></a> [tfstate\_file\_name](#input\_tfstate\_file\_name) | Terraform S3 Backend Name | `string` | `"chatbot23-tf-state-file"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_terraform_state_s3_id"></a> [terraform\_state\_s3\_id](#output\_terraform\_state\_s3\_id) | TF State Backend S3 Name |
<!-- END_TF_DOCS -->
