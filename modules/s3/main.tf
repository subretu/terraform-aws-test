data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions = ["s3:GetObject"]
    effect  = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    resources = ["arn:aws:s3:::subretu-vue-webhost/*"]
    sid       = "PublicReadGetObject"
  }
}


resource "aws_s3_bucket" "subretu-vue-webhost" {
  bucket = "subretu-vue-webhost"
  acl    = "public-read"
  policy = data.aws_iam_policy_document.s3_policy.json

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
