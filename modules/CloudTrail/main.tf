# Create an S3 bucket to store CloudTrail logs
resource "aws_s3_bucket" "cloudtrail_bucket" {
  bucket        = "${terraform.workspace}-${var.project_name}-cloud-trail-logs"
  force_destroy = true
  tags = {
    projectName = var.project_name
    Environment = terraform.workspace
  }
}

data "aws_iam_policy_document" "trail_bucket_policy" {
  statement {
    sid    = "AWSCloudTrailAclCheck"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }

    actions   = ["s3:GetBucketAcl"]
    resources = [aws_s3_bucket.cloudtrail_bucket.arn]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values = [
        "arn:${data.aws_partition.current.partition}:cloudtrail:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:trail/cloudtrail-${var.project_name}"
      ]
    }
  }

  statement {
    sid    = "AWSCloudTrailWrite"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    actions = ["s3:PutObject"]
    resources = [
      "${aws_s3_bucket.cloudtrail_bucket.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
    ]
    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceArn"
      values = [
        "arn:${data.aws_partition.current.partition}:cloudtrail:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:trail/cloudtrail-${var.project_name}"
      ]
    }
  }

  # This allows CloudTrail to work with S3 when using global services like IAM, STS, etc.
  statement {
    sid    = "AWSCloudTrailS3BucketPermissions"
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudtrail.amazonaws.com"]
    }
    actions   = ["s3:GetBucketLocation"]
    resources = [aws_s3_bucket.cloudtrail_bucket.arn]
  }
}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}

resource "aws_s3_bucket_policy" "trail_bucket_policy" {
  bucket = aws_s3_bucket.cloudtrail_bucket.id
  policy = data.aws_iam_policy_document.trail_bucket_policy.json
}

# Create the CloudTrail
resource "aws_cloudtrail" "chatbot_trail" {
  name                          = "cloudtrail-${var.project_name}"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_bucket.bucket
  include_global_service_events = true
  #is_multi_region_trail         = true
  enable_log_file_validation = true
  #cloud_watch_logs_group_arn    = aws_cloudwatch_log_group.cloudtrail_log_group.arn
  #cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail_role.arn
  kms_key_id = var.kms_key_id # Optional, for encrypting CloudTrail logs
  depends_on = [
    aws_s3_bucket.cloudtrail_bucket,
    aws_s3_bucket_policy.trail_bucket_policy
  ]

  event_selector {
    read_write_type           = "All"
    include_management_events = true
    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::${aws_s3_bucket.cloudtrail_bucket.bucket}/"]
    }
  }
  tags = {
    Environment = terraform.workspace
    Project     = var.project_name
  }
}
