output "chatbot_vpc_id" {
  value = module.vpc.vpc_id
}

output "chatbot_public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "chatbot_private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "chatbot_nat_gateway_id" {
  value = module.vpc.nat_gateway_ids
}