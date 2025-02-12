# AWS Config Delivery Channel
resource "aws_s3_bucket" "config_logs" {
  bucket = "${terraform.workspace}-${var.project_name}-config-logs"
  tags = {
    projectName = var.project_name
    Environment = terraform.workspace
  }
}

resource "aws_config_config_rule" "chatbot_config_rule" {
  name = "${terraform.workspace}-${var.project_name}-ConfigRule"
  source {
    owner             = "AWS"
    source_identifier = "S3_BUCKET_VERSIONING_ENABLED"
  }
  depends_on = [aws_config_configuration_recorder.chatbot_config_recorder]
}

resource "aws_s3_bucket_policy" "config_logs_policy" {
  bucket = aws_s3_bucket.config_logs.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowAWSConfigDelivery",
        Effect    = "Allow",
        Principal = { Service = "config.amazonaws.com" },
        Action = [
          "s3:PutObject"
        ],
        Resource = "${aws_s3_bucket.config_logs.arn}/*",
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      },
      {
        Sid       = "AllowGetBucketAcl",
        Effect    = "Allow",
        Principal = { Service = "config.amazonaws.com" },
        Action    = "s3:GetBucketAcl",
        Resource  = aws_s3_bucket.config_logs.arn
      }
    ]
  })
}

# AWS Config Role
resource "aws_iam_role" "config_role" {
  name = "${var.project_name}-config-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = { Service = "config.amazonaws.com" }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "config_policy_attachment" {
  role       = aws_iam_role.config_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
}

# AWS Config Recorder
resource "aws_config_configuration_recorder" "chatbot_config_recorder" {
  name       = "${terraform.workspace}-${var.project_name}-recorder"
  role_arn   = aws_iam_role.config_role.arn
  depends_on = [aws_s3_bucket.config_logs]
  recording_group {
    all_supported                 = true
    include_global_resource_types = true
  }
}

# Delivery Channel
resource "aws_config_delivery_channel" "s3_delivery_channel" {
  name           = "${terraform.workspace}-${var.project_name}-channel"
  s3_bucket_name = aws_s3_bucket.config_logs.id
}
