locals {
  deployment_archive_path = "${path.module}/build.zip"
}


resource "aws_lambda_function" "sns_to_sentry" {
  function_name = "${var.name}-sns-to-sentry"
  handler       = "sns_to_sentry.lambda_handler.sns_to_sentry"
  role          = aws_iam_role.sns_to_sentry.arn
  runtime       = "python3.7"

  timeout     = 300
  memory_size = 128

  reserved_concurrent_executions = 10

  filename = local.deployment_archive_path
  source_code_hash = filebase64sha256(local.deployment_archive_path)

  environment {
    variables = {
      MESSAGE    = var.message
      SENTRY_DSN = var.sentry_dsn
    }
  }

  tags = var.tags
}

resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sns_to_sentry.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.this.arn
}
