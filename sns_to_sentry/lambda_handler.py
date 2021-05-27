import logging
import os

from sentry_sdk import init
from sentry_sdk.integrations.aws_lambda import AwsLambdaIntegration

init(
    dsn=os.environ["SENTRY_DSN"],
    integrations=[AwsLambdaIntegration()],
)
logger = logging.getLogger(__name__)


def sns_to_sentry(event, context):
    """Handle event from SNS and send it to Sentry."""   # noqa: DAR101
    logger.error(os.environ['MESSAGE'], {
        'event': event,
    })
