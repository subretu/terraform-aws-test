resource "aws_cloudwatch_event_rule" "lambda_sample_cron" {
  name                = "lambda-sample-cron"
  schedule_expression = "cron(00 21 * * ? *)"
  is_enabled          = true
}

resource "aws_cloudwatch_event_target" "lambda_sample_cron_event_target" {
  rule = aws_cloudwatch_event_rule.lambda_sample_cron.name
  arn  = aws_lambda_function.lambda_sample.arn
}
