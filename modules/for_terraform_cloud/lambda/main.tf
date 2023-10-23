data "archive_file" "function_source" {
  type        = "zip"
  source_dir  = "../../src"
  output_path = "archive/my_lambda_function.zip"
}

resource "aws_lambda_function" "function" {
  function_name = "lambda_function"
  handler       = "lambda_function.handler"
  role          = aws_iam_role.lambda.arn
  runtime       = "python3.9"

  filename         = data.archive_file.function_source.output_path
  source_code_hash = data.archive_file.function_source.output_base64sha256

  memory_size = 256
  timeout     = 60
}

# Lambda関数用のIAMロールの定義
data "aws_iam_policy_document" "lambda_assume_role_document" {
  statement {
    effect = "Allow"

    principals {
      identifiers = [
        "lambda.amazonaws.com"
      ]
      type = "Service"
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role" "lambda" {
  name               = "sample-lambda-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_document.json
}

resource "aws_iam_role_policy_attachment" "aws_lambda_basic_execution_role" {
  role       = aws_iam_role.lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
