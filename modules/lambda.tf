data "archive_file" "function_source" {
  type        = "zip"
  source_dir  = "../../src"
  output_path = "archive/my_lambda_function.zip"
}

resource "aws_lambda_function" "lambda_sample" {
  function_name = "lambda-sample"
  handler       = "lambda_function.lambda_handler"
  role          = aws_iam_role.lambda.arn
  runtime       = "python3.10"

  filename         = data.archive_file.function_source.output_path
  source_code_hash = data.archive_file.function_source.output_base64sha256

  memory_size = 256
  timeout     = 60
}

resource "aws_lambda_permission" "allow_cloudwatch_lambda_sample" {
  action        = "lambda:InvokeFunction"
  principal     = "events.amazonaws.com"
  function_name = aws_lambda_function.lambda_sample.function_name
  source_arn    = aws_cloudwatch_event_rule.lambda_sample_cron.arn
}
