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

resource "aws_s3_bucket" "subretu_vue_webhost" {
  bucket = "subretu_vue_webhost"
  policy = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_s3_bucket_acl" "subretu_vue_webhost_acl" {
  bucket = aws_s3_bucket.subretu_vue_webhost.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "subretu_vue_webhost_website_config" {
  bucket = aws_s3_bucket.subretu_vue_webhost.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}
