import pytz
from datetime import datetime


def lambda_handler(event: dict, context):
    UTC = pytz.timezone("UTC")
    now = datetime.now(UTC)
    timestamp = now.timestamp()
    return timestamp
