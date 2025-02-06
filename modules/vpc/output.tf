output "vpc_id" {
  value = aws_vpc.chatbot-app.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.nat[*].id
}

# output "nat_gateway_mapping" {
#   value = {
#     for idx, private_subnet in module.vpc.private_subnet_ids :
#     private_subnet => module.vpc.nat_gateway_ids[idx]
#   }
# }

