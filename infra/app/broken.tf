resource "aws_iam_policy" "broken" {
  policy = <<EOT
{ "Statement": [] }
