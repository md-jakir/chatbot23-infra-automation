resource "aws_codestarconnections_connection" "connection" {
  name          = var.codestart_connection
  provider_type = var.type_provider
}