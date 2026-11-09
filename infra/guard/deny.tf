# Synthetic fixture (PLAN-208, iam suite): the only Deny
resource "aws_iam_policy" "guard" {
  name = "e2e-guard"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Deny", Action = "s3:DeleteBucket", Resource = "arn:aws:s3:::e2e-iam-bucket" }]
  })
}
