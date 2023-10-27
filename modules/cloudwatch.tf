resource "aws_cloudwatch_event_rule" "lambda_sample_cron" {
  name                = "lambda-sample-cron"
  schedule_expression = "cron(00 21 * * ? *)"
  is_enabled          = true
}

resource "aws_cloudwatch_event_target" "lambda_sample_cron_event_target" {
  rule = aws_cloudwatch_event_rule.lambda_sample_cron.name
  arn  = aws_lambda_function.lambda_sample.arn
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_sample_alarm" {
  alarm_name         = "cloudwatch-sample-alarm"
  evaluation_periods = 1
  namespace          = "AWS/Lambda"
  metric_name        = "SampleCheck"
  dimensions = {
    FunctionName = aws_lambda_function.lambda_sample.function_name
  }
  period              = 120
  statistic           = "Average"
  threshold           = 1000
  comparison_operator = "GreaterThanThreshold"
}
