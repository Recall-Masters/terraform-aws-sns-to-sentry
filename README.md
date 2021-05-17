# terraform-aws-sns-to-sentry


Terraform module which constructs:

- SNS topic for incoming events;
- Lambda function which send messages to sentry by DNS;
- Event source mapping to trigger the provided Lambda from the aforementioned topic;

## Usage

```hcl
module trigger-my-lambda-from-s3 {
  source = "Recall-Masters/terraform-aws-sns-to-sentry/aws"
  version = "0.0.1"

  name = "${local.prefix}-my-topic-incoming-notifications"
  sentry_dsn = "https://public@sentry.example.com/1"
  message = "Example message which will be sended to sentry."
}
```

## Outputs

- `module.terraform-aws-sns-to-sentry.topic.id` is the ARN of the topic that will trigger the Lambda,
