# ALB

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
| [aws_lb.internal_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb.internet_alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.internal_alb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.internet_alb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.internal_alb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.internet_alb_tg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.db_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.frontend_app_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.internal_alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.internet_alb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_frontend_sg"></a> [app\_frontend\_sg](#input\_app\_frontend\_sg) | Frontend App Security Group Prefix Name | `string` | n/a | yes |
| <a name="input_backend_sg_prefix_name"></a> [backend\_sg\_prefix\_name](#input\_backend\_sg\_prefix\_name) | Backend Security Group Prefix Name | `string` | n/a | yes |
| <a name="input_chatbot_backend_alb"></a> [chatbot\_backend\_alb](#input\_chatbot\_backend\_alb) | Backend ALB Name | `string` | n/a | yes |
| <a name="input_chatbot_backend_tg"></a> [chatbot\_backend\_tg](#input\_chatbot\_backend\_tg) | Backend App Target Group Name | `string` | n/a | yes |
| <a name="input_chatbot_frontend_alb"></a> [chatbot\_frontend\_alb](#input\_chatbot\_frontend\_alb) | Frontend ALB Name | `string` | n/a | yes |
| <a name="input_chatbot_frontend_tg"></a> [chatbot\_frontend\_tg](#input\_chatbot\_frontend\_tg) | Frontend App Target Group Name | `string` | n/a | yes |
| <a name="input_db_security_group"></a> [db\_security\_group](#input\_db\_security\_group) | DB Security Group Name | `string` | n/a | yes |
| <a name="input_frontend_sg_prefix_name"></a> [frontend\_sg\_prefix\_name](#input\_frontend\_sg\_prefix\_name) | Frontend Security Group Prefix Name | `string` | n/a | yes |
| <a name="input_internal_alb_egress_ports"></a> [internal\_alb\_egress\_ports](#input\_internal\_alb\_egress\_ports) | The internal ALB ingress ports | `list(string)` | n/a | yes |
| <a name="input_internal_alb_ingress_ports"></a> [internal\_alb\_ingress\_ports](#input\_internal\_alb\_ingress\_ports) | The internal ALB ingress ports | `list(string)` | n/a | yes |
| <a name="input_public_alb_egress_ports"></a> [public\_alb\_egress\_ports](#input\_public\_alb\_egress\_ports) | The Security Group egress port for public ALB | `list(string)` | n/a | yes |
| <a name="input_public_alb_ingress_ports"></a> [public\_alb\_ingress\_ports](#input\_public\_alb\_ingress\_ports) | The Security Group ingress port for public ALB | `list(string)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | List of public subnet IDs for internet-facing ALB | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where ALBs will be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_security_group_ids"></a> [db\_security\_group\_ids](#output\_db\_security\_group\_ids) | n/a |
| <a name="output_frontend_security_group"></a> [frontend\_security\_group](#output\_frontend\_security\_group) | n/a |
| <a name="output_internal_alb_arn"></a> [internal\_alb\_arn](#output\_internal\_alb\_arn) | n/a |
| <a name="output_internal_alb_tg_arn"></a> [internal\_alb\_tg\_arn](#output\_internal\_alb\_tg\_arn) | n/a |
| <a name="output_internal_security_group_id"></a> [internal\_security\_group\_id](#output\_internal\_security\_group\_id) | n/a |
| <a name="output_internet_alb_arn"></a> [internet\_alb\_arn](#output\_internet\_alb\_arn) | n/a |
| <a name="output_internet_alb_tg_arn"></a> [internet\_alb\_tg\_arn](#output\_internet\_alb\_tg\_arn) | n/a |
| <a name="output_internet_security_group_id"></a> [internet\_security\_group\_id](#output\_internet\_security\_group\_id) | n/a |
<!-- END_TF_DOCS -->
