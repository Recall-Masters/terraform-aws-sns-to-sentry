
import os
import logging

from sentry_sdk import init
from sentry_sdk.integrations.aws_lambda import AwsLambdaIntegration

init(
    dsn=os.environ["SENTRY_DSN"],
    integrations=[AwsLambdaIntegration()],
)
logger = logging.getLogger(__name__)


def handler(event, context):
    logger.error(os.environ['MESSAGE'])
