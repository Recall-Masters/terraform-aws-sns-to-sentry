# terraform-aws-sns-to-sentry


Terraform module which constructs:

- SNS topic for incoming events;
- Lambda function which send messages to sentry by DSN;
- Event source mapping to trigger the provided Lambda from the aforementioned topic;

## Usage

```hcl
module sentry-budget-notification {
  source = "Recall-Masters/sns-to-sentry/aws"
  version = "0.0.7"

  name          = "${local.prefix}-incoming-budget-notifications"
  sentry_dsn    = "https://public@sentry.example.com/1"
  message       = "Budget limit has exceeded."
  environment   = "dev"
  aws_principal = "budgets.amazonaws.com"  ## principal set in sns topic policy, from which sns will receive notifications.
  kms_key_arn   = aws_kms_key.example.arn  ## kms key should be created in project where module added
}
```

## Outputs

- `module.terraform-aws-sns-to-sentry.sns_topic.id` is the ARN of the topic that will trigger the Lambda
- `module.terraform-aws-sns-to-sentry.iam_policy.arn` is the ARN of the iam pollicy that have publish access to topic
