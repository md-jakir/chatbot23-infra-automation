output "chatbot_vpc_id" {
  value       = module.vpc.vpc_id
  description = "Output of VPC ID"
}

output "chatbot_public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "Public Subents IDs"
}

output "chatbot_private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "Private Subent IDs"
}

output "chatbot_nat_gateway_id" {
  value       = module.vpc.nat_gateway_ids
  description = "Nate Gateway ID"
}
