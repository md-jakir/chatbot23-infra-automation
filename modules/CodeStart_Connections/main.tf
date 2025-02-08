resource "aws_codestarconnections_connection" "connection" {
  name          = "${terraform.workspace}-${var.codestart_connection}"
  provider_type = var.type_provider

  tags = {
    Environment = "${terraform.workspace}"
  }
}