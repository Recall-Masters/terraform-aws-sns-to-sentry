variable "name" {
  type = string
}

variable "sentry_dsn" {
  type = string
}

variable "message" {
  type = string
}

variable "tags" {
  default     = {}
  description = "Tags to use for each of the created resources."
}

variable "environment" {
  description = "AWS environment we work at: dev, staging, or production."
}

variable "aws_principal" {
  default     = "cloudwatch.amazonaws.com"
  description = "AWS Service principal from which sns will recieve notifications"
}

variable "kms_key_arn" {
  description = "SNS topic KMS encryption key arn"
}
