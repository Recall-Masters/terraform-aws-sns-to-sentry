import logging
import os

from pydantic import validate_arguments
from sentry_sdk import init
from sentry_sdk.integrations.aws_lambda import AwsLambdaIntegration

from sns_to_sentry.models import SNSEvent

init(
    dsn=os.environ["SENTRY_DSN"],
    integrations=[AwsLambdaIntegration()],
)
logger = logging.getLogger(__name__)


@validate_arguments
def sns_to_sentry(event: SNSEvent, context):
    """Handle event from SNS and send it to Sentry."""   # noqa: DAR101
    for record in event.records:
        logger.error(os.environ['MESSAGE'], extra={
            'event': record.sns.message,
        })
