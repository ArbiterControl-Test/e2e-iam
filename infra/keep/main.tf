# Synthetic fixture for the Arbiter live suite (TFK): TFK-MARKER-aaebd47d3b0765b939ddf14aa09eef16
resource "aws_iam_policy" "keep" {
  name        = "e2e-keep"
  description = "TFK-MARKER-aaebd47d3b0765b939ddf14aa09eef16"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{ Sid = "TFK-MARKER-aaebd47d3b0765b939ddf14aa09eef16", Effect = "Allow", Action = "*", Resource = "arn:aws:s3:::e2e-iam-bucket/*" }]
  })
}

resource "aws_iam_policy" "keep_doc" {
  name   = "e2e-keep-doc"
  policy = file("${path.module}/doc.json")
}
