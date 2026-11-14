# Synthetic fixture for the Arbiter live suite (TFK): TFK-MARKER-3bd606fe33b4e154397cb2d787a26b8f
resource "aws_iam_policy" "keep" {
  name        = "e2e-keep"
  description = "TFK-MARKER-3bd606fe33b4e154397cb2d787a26b8f"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{ Sid = "TFK-MARKER-3bd606fe33b4e154397cb2d787a26b8f", Effect = "Allow", Action = "*", Resource = "arn:aws:s3:::e2e-iam-bucket/*" }]
  })
}

resource "aws_iam_policy" "keep_doc" {
  name   = "e2e-keep-doc"
  policy = file("${path.module}/doc.json")
}
