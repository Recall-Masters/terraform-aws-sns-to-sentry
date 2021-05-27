from typing import List

from pydantic import BaseModel, Field, Json


class SNSMessage(BaseModel):
    """State Machine status change message."""

    message: Json[dict] = Field(alias='Message')


class SNSRecord(BaseModel):
    """Individual SNS record."""

    sns: SNSMessage = Field(alias='Sns')


class SNSEvent(BaseModel):
    """Object we receive from the SNS queue."""

    records: List[SNSRecord] = Field(alias='Records')
