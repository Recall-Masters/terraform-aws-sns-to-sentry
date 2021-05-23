output "sns_topic" {
  value = aws_sns_topic.this
}

output "iam_policy" {
  value = aws_iam_policy.publish_to_sns
}
