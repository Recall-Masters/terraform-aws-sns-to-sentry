# terraform-aws-sns-to-sentry


Terraform module which constructs:

- Encrypted with kms key SNS topic for incoming events;
- Lambda function which send messages to sentry by DSN;
- Event source mapping to trigger the provided Lambda from the aforementioned topic;

## Usage

```hcl
module sentry-budget-notification {
  source = "git@github.com:Recall-Masters/terraform-aws-sns-to-sentry.git?ref=0.0.8" 

  name          = "${local.prefix}-incoming-budget-notifications"
  sentry_dsn    = "https://public@sentry.example.com/1"
  message       = "Budget limit has exceeded."
  environment   = "dev"
  aws_principal = "budgets.amazonaws.com"  ## principal set in sns topic policy, from which sns will receive notifications.
  kms_key_arn   = aws_kms_key.example.arn  ## kms key for sns should be created in project where module added
}
```

## Outputs

- `module.terraform-aws-sns-to-sentry.sns_topic.id` is the ARN of the topic that will trigger the Lambda
- `module.terraform-aws-sns-to-sentry.iam_policy.arn` is the ARN of the iam pollicy that have publish access to topic
- `module.terraform-aws-sns-to-sentry.iam_role_arn` is the ARN of the lambda iam role
