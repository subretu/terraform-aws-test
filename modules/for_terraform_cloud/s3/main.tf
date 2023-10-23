resource "aws_s3_bucket" "subretu-vue-webhost" {
  bucket = "subretu-vue-webhost"
}

resource "aws_s3_bucket_policy" "subretu-vue-webhost_allow_access" {
  bucket = aws_s3_bucket.subretu-vue-webhost.id
  policy = data.aws_iam_policy_document.subretu-vue-webhost_allow_access.json
}

data "aws_iam_policy_document" "subretu-vue-webhost_allow_access" {
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

resource "aws_s3_bucket_acl" "subretu-vue-webhost_acl" {
  bucket = aws_s3_bucket.subretu-vue-webhost.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "subretu-vue-webhost_website_config" {
  bucket = aws_s3_bucket.subretu-vue-webhost.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}
