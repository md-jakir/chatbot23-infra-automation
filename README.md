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

