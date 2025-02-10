# frontend_ecs_service

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
| [aws_ecs_service.frontend_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | log group region | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | Internet ALB Target Group | `string` | `"80"` | no |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | Internet ALB Target Group | `string` | n/a | yes |
| <a name="input_frontend_container"></a> [frontend\_container](#input\_frontend\_container) | Internet ALB Target Group | `string` | `"admin-dashboard"` | no |
| <a name="input_frontend_security_groups"></a> [frontend\_security\_groups](#input\_frontend\_security\_groups) | List of security group IDs for ECS service | `list(string)` | n/a | yes |
| <a name="input_frontend_taskdef_arn"></a> [frontend\_taskdef\_arn](#input\_frontend\_taskdef\_arn) | The ARN of the frontend task def. | `string` | n/a | yes |
| <a name="input_internet_alb_tg"></a> [internet\_alb\_tg](#input\_internet\_alb\_tg) | Internet ALB Target Group | `string` | n/a | yes |
| <a name="input_port_name_alias"></a> [port\_name\_alias](#input\_port\_name\_alias) | Internet ALB Target Group | `string` | `"admin-dashboard-80-tcp"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of public subnet IDs for ECS service | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The Project Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecs_service_name"></a> [ecs\_service\_name](#output\_ecs\_service\_name) | ECS Service Name |
<!-- END_TF_DOCS -->
