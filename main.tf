resource "aws_s3_bucket" "uploads_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name = "Uploads Bucket"
  }
}

resource "aws_iam_role" "s3_upload_role" {
  name = "s3_upload_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole",
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "s3_upload_policy" {
  name = "s3_upload_1234"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action   = ["s3:PutObject"],
      Effect   = "Allow",
      Resource = "${aws_s3_bucket.uploads_bucket.arn}/*"
    }]
  })
}yes

resource "aws_iam_role_policy_attachment" "s3_upload_policy_attachment" {
  role       = aws_iam_role.s3_upload_role.name
  policy_arn = aws_iam_policy.s3_upload_policy.arn
}
