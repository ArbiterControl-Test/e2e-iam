# Synthetic fixture for the Arbiter live suite (TFK): TFK-MARKER-b33f58932cedbdd08a455dce309655ac
resource "aws_iam_policy" "keep" {
  name        = "e2e-keep"
  description = "TFK-MARKER-b33f58932cedbdd08a455dce309655ac"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{ Sid = "TFK-MARKER-b33f58932cedbdd08a455dce309655ac", Effect = "Allow", Action = "*", Resource = "arn:aws:s3:::e2e-iam-bucket/*" }]
  })
}

resource "aws_iam_policy" "keep_doc" {
  name   = "e2e-keep-doc"
  policy = file("${path.module}/doc.json")
}
