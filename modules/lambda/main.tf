data "archive_file" "function_source" {
  type        = "zip"
  source_dir  = "../../src"
  output_path = "archive/my_lambda_function.zip"
}

resource "aws_lambda_function" "function" {
  function_name = "lambda_function"
  handler       = "lambda_function.handler"
  role          = aws_iam_role.lambda_role.arn
  runtime       = "python3.9"

  filename         = data.archive_file.function_source.output_path
  source_code_hash = data.archive_file.function_source.output_base64sha256

  memory_size = 256
  timeout     = 60
}

# Lambda関数用の最小限のIAMロールの定義
resource "aws_iam_role" "lambda_role" {
  name               = "lambda_role_sample"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
