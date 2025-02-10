resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.tfstate_file_name}-${var.region_name}"
  tags = {
    Environment = terraform.workspace
  }
}
