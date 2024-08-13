output "bucket_name" {
  value = aws_s3_bucket.uploads_bucket.id
}

output "iam_role_arn" {
  value = aws_iam_role.s3_upload_role.arn
}
