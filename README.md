# chatbot-IaC
Automate the two tier application infrastructure.

# AWS services are provisioned with this IaC
-  AWS Config
-  CloudTrail
-  S3 Bucket
-  ECS Cluster
-  ECS Task Definition
-  ECS Services
-  IAM Role and Policies
-  CodeBuild
-  CodePipeline
-  CodeStartConnection
-  Parameter Store
-  VPC
-  ALB
-  ECR
-  CloudWatch Log
# Project Structure

    tf_workspace_proj/
    ├── README.md
    ├── dev.tfvars
    ├── ecs-tasks-def
    │   ├── backend-task-def.json
    │   └── frontend-task-def.json
    ├── env
    │   ├── backend_s3_dev.hcl
    │   └── backend_s3_prod.hcl
    ├── main.tf
    ├── modules
    │   ├── ALB
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── AWSConfig
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── BackendTaskDef
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── BastionHost
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── CloudTrail
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── CodeStart_Connections
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── ECR
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── ECS
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variable.tf
    │   ├── FrontendTaskDef
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── IAM
    │   │   ├── main.tf
    │   │   ├── outputs.tf
    │   │   └── variables.tf
    │   ├── RDS
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── TfStateBackend
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── backend_codepipeline
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── backend_ecs_service
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── codebuild_backend
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── codebuild_frontend
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── frontend_codepipeline
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── frontend_ecs_service
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   ├── parameter_store
    │   │   ├── main.tf
    │   │   ├── output.tf
    │   │   └── variables.tf
    │   └── vpc
    │       ├── main.tf
    │       ├── output.tf
    │       └── variables.tf
    ├── outputs.tf
    ├── prod.tfvars
    ├── terraform.tfstate
    ├── terraform.tfstate.d
    │   ├── dev
    │   │   ├── terraform.tfstate
    │   │   └── terraform.tfstate.backup
    │   └── prod
    │       ├── terraform.tfstate
    │       └── terraform.tfstate.backup
    ├── terraform.tfvars
    └── variables.tf
# Project Infrastructure Design
![image](https://github.com/user-attachments/assets/04a3ca86-6684-41ff-92bc-dfe2a959418c)
# Checkov Result
![image](https://github.com/user-attachments/assets/76ed8bc3-31a1-4f2d-abae-7ccc0f96fce3)
![image](https://github.com/user-attachments/assets/73dfe59c-0a01-4171-828d-0181e85436b3)
![image](https://github.com/user-attachments/assets/e2ff6ae5-3b25-4138-8b25-0540cfcbf79b)
# terrascan result
![image](https://github.com/user-attachments/assets/69041ce4-3266-4ca5-9cdf-762187ea6495)


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.85.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 4.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ./modules/ALB | n/a |
| <a name="module_backend_codebuild"></a> [backend\_codebuild](#module\_backend\_codebuild) | ./modules/codebuild_backend | n/a |
| <a name="module_backend_taskdef"></a> [backend\_taskdef](#module\_backend\_taskdef) | ./modules/BackendTaskDef | n/a |
| <a name="module_chatbot_backend_codepipeline"></a> [chatbot\_backend\_codepipeline](#module\_chatbot\_backend\_codepipeline) | ./modules/backend_codepipeline | n/a |
| <a name="module_chatbot_codepipeline"></a> [chatbot\_codepipeline](#module\_chatbot\_codepipeline) | ./modules/frontend_codepipeline | n/a |
| <a name="module_cloudtrail"></a> [cloudtrail](#module\_cloudtrail) | ./modules/CloudTrail | n/a |
| <a name="module_codestart_connection_github"></a> [codestart\_connection\_github](#module\_codestart\_connection\_github) | ./modules/CodeStart_Connections | n/a |
| <a name="module_config"></a> [config](#module\_config) | ./modules/AWSConfig | n/a |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./modules/ECR | n/a |
| <a name="module_ecs"></a> [ecs](#module\_ecs) | ./modules/ECS | n/a |
| <a name="module_ecs_service_backend"></a> [ecs\_service\_backend](#module\_ecs\_service\_backend) | ./modules/backend_ecs_service | n/a |
| <a name="module_ecs_service_frontend"></a> [ecs\_service\_frontend](#module\_ecs\_service\_frontend) | ./modules/frontend_ecs_service | n/a |
| <a name="module_fronted_taskdef"></a> [fronted\_taskdef](#module\_fronted\_taskdef) | ./modules/FrontendTaskDef | n/a |
| <a name="module_frontend_codebuild"></a> [frontend\_codebuild](#module\_frontend\_codebuild) | ./modules/codebuild_frontend | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/IAM | n/a |
| <a name="module_parameter_store"></a> [parameter\_store](#module\_parameter\_store) | ./modules/parameter_store | n/a |
| <a name="module_tf_state_backend_s3"></a> [tf\_state\_backend\_s3](#module\_tf\_state\_backend\_s3) | ./modules/TfStateBackend | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_kv_secret_v2.chatbot23_kv](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/kv_secret_v2) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_frontend_sg"></a> [app\_frontend\_sg](#input\_app\_frontend\_sg) | Frontend App Security Group Prefix Name | `string` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones to use | `list(string)` | n/a | yes |
| <a name="input_backend"></a> [backend](#input\_backend) | Backend container configuration | <pre>object({<br/>    image  = string<br/>    cpu    = number<br/>    memory = number<br/>    port   = number<br/>  })</pre> | n/a | yes |
| <a name="input_backend_sg_prefix_name"></a> [backend\_sg\_prefix\_name](#input\_backend\_sg\_prefix\_name) | Backend Security Group Prefix Name | `string` | n/a | yes |
| <a name="input_chatbot_backend_alb"></a> [chatbot\_backend\_alb](#input\_chatbot\_backend\_alb) | Backend ALB Name | `string` | n/a | yes |
| <a name="input_chatbot_backend_tg"></a> [chatbot\_backend\_tg](#input\_chatbot\_backend\_tg) | Backend App Target Group Name | `string` | n/a | yes |
| <a name="input_chatbot_frontend_alb"></a> [chatbot\_frontend\_alb](#input\_chatbot\_frontend\_alb) | Frontend ALB Name | `string` | n/a | yes |
| <a name="input_chatbot_frontend_tg"></a> [chatbot\_frontend\_tg](#input\_chatbot\_frontend\_tg) | Frontend App Target Group Name | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the ECS cluster | `string` | n/a | yes |
| <a name="input_codebuild_fontend_project_name"></a> [codebuild\_fontend\_project\_name](#input\_codebuild\_fontend\_project\_name) | The frontend codebulid project name | `string` | n/a | yes |
| <a name="input_codebuild_project_name"></a> [codebuild\_project\_name](#input\_codebuild\_project\_name) | The backend codebulid project name | `string` | n/a | yes |
| <a name="input_codestart_connection"></a> [codestart\_connection](#input\_codestart\_connection) | CodeStart Connection Name | `string` | n/a | yes |
| <a name="input_db_security_group"></a> [db\_security\_group](#input\_db\_security\_group) | DB Security Group Name | `string` | n/a | yes |
| <a name="input_frontend"></a> [frontend](#input\_frontend) | Frontend container configuration | <pre>object({<br/>    image  = string<br/>    cpu    = number<br/>    memory = number<br/>    port   = number<br/>  })</pre> | n/a | yes |
| <a name="input_frontend_pipeline_name"></a> [frontend\_pipeline\_name](#input\_frontend\_pipeline\_name) | Name of the CodePipeline | `string` | n/a | yes |
| <a name="input_frontend_sg_prefix_name"></a> [frontend\_sg\_prefix\_name](#input\_frontend\_sg\_prefix\_name) | Frontend Security Group Prefix Name | `string` | n/a | yes |
| <a name="input_internal_alb_egress_ports"></a> [internal\_alb\_egress\_ports](#input\_internal\_alb\_egress\_ports) | The internal ALB ingress ports | `list(string)` | n/a | yes |
| <a name="input_internal_alb_ingress_ports"></a> [internal\_alb\_ingress\_ports](#input\_internal\_alb\_ingress\_ports) | The internal ALB ingress ports | `list(string)` | n/a | yes |
| <a name="input_pipeline_name"></a> [pipeline\_name](#input\_pipeline\_name) | Name of the CodePipeline | `string` | n/a | yes |
| <a name="input_private_subnet_cidrs"></a> [private\_subnet\_cidrs](#input\_private\_subnet\_cidrs) | List of CIDR blocks for private subnets | `list(string)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name for resources | `string` | `"chatbot23"` | no |
| <a name="input_public_alb_egress_ports"></a> [public\_alb\_egress\_ports](#input\_public\_alb\_egress\_ports) | The Security Group egress port for public ALB | `list(string)` | n/a | yes |
| <a name="input_public_alb_ingress_ports"></a> [public\_alb\_ingress\_ports](#input\_public\_alb\_ingress\_ports) | The Security Group ingress port for public ALB | `list(string)` | n/a | yes |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | List of CIDR blocks for public subnets | `list(string)` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Region Name | `string` | n/a | yes |
| <a name="input_repository_names"></a> [repository\_names](#input\_repository\_names) | Names of the ECR repositories to create | `list(string)` | n/a | yes |
| <a name="input_vault_role_id"></a> [vault\_role\_id](#input\_vault\_role\_id) | Vault Role ID | `string` | n/a | yes |
| <a name="input_vault_secret_id"></a> [vault\_secret\_id](#input\_vault\_secret\_id) | Vault Secret ID | `string` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_chatbot_nat_gateway_id"></a> [chatbot\_nat\_gateway\_id](#output\_chatbot\_nat\_gateway\_id) | Nate Gateway ID |
| <a name="output_chatbot_private_subnet_ids"></a> [chatbot\_private\_subnet\_ids](#output\_chatbot\_private\_subnet\_ids) | Private Subent IDs |
| <a name="output_chatbot_public_subnet_ids"></a> [chatbot\_public\_subnet\_ids](#output\_chatbot\_public\_subnet\_ids) | Public Subents IDs |
| <a name="output_chatbot_vpc_id"></a> [chatbot\_vpc\_id](#output\_chatbot\_vpc\_id) | Output of VPC ID |
<!-- END_TF_DOCS -->
