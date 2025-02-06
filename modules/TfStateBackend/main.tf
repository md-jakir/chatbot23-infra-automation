resource "aws_s3_bucket" "terraform_state" {
  bucket        = "${terraform.workspace}-tf-state-file-${var.region_name}"

  tags = {
    Name        = "${terraform.workspace}-TFState"
    Environment = "${terraform.workspace}"
  }
}