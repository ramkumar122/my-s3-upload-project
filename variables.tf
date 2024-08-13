variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "The name of the S3 bucket for uploads"
  type        = string
  default     = "my-unique-s3-bucket"
}
