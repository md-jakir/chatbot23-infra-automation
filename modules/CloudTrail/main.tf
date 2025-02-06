# Create an S3 bucket to store CloudTrail logs
resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket = "cloudtrail-logs-${var.project_name}-${var.region}"
  force_destroy = true
}

# Attach bucket policy for CloudTrail to write logs
resource "aws_s3_bucket_policy" "cloudtrail_bucket_policy" {
  bucket = aws_s3_bucket.cloudtrail_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AWSCloudTrailAclCheck",
        Effect    = "Allow",
        Principal = { Service = "cloudtrail.amazonaws.com" },
        Action    = "s3:GetBucketAcl",
        #Resource  = "${aws_s3_bucket.cloudtrail_bucket.arn}"
        Resource  = "arn:aws:s3:::cloudtrail-logs-chatbot23-ap-southeast-1"
      },
      {
        Sid       = "AWSCloudTrailWrite",
        Effect    = "Allow",
        Principal = { Service = "cloudtrail.amazonaws.com" },
        Action    = "s3:PutObject",
        #Resource  = "${aws_s3_bucket.cloudtrail_bucket.arn}/*",
        Resource  = "arn:aws:s3:::cloudtrail-logs-chatbot23-ap-southeast-1/AWSLogs/*",
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}

# Create the CloudTrail
resource "aws_cloudtrail" "chatbot_trail" {
  name                          = "cloudtrail-${var.project_name}"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_bucket.bucket
  depends_on = [ aws_s3_bucket.cloudtrail_bucket ]
  include_global_service_events = true
  #is_multi_region_trail         = true
  enable_log_file_validation    = true
  #cloud_watch_logs_group_arn    = aws_cloudwatch_log_group.cloudtrail_log_group.arn
  #cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail_role.arn
  kms_key_id                    = var.kms_key_id # Optional, for encrypting CloudTrail logs

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::${aws_s3_bucket.cloudtrail_bucket.bucket}/"]
    }
  }

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
