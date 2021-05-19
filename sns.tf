resource "aws_sns_topic" "this" {
  name = var.name
}

resource "aws_sns_topic_subscription" "this" {
  endpoint  = aws_lambda_function.sns_to_sentry.arn
  protocol  = "lambda"
  topic_arn = aws_sns_topic.this.arn

  depends_on = [
    aws_sns_topic.this,
    aws_lambda_function.sns_to_sentry
  ]
}
