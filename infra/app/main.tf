# Synthetic fixture for the Arbiter live suite (PLAN-208, iam suite)
resource "aws_iam_role" "app" {
  name               = "e2e-app"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "sts:AssumeRole", Principal = { Service = "ec2.amazonaws.com", AWS = "arn:aws:iam::444455556666:root" } }]
  })
}

resource "aws_iam_role_policy" "read" {
  name = "read"
  role = aws_iam_role.app.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "s3:GetObject", Resource = "arn:aws:s3:::e2e-iam-bucket/*" }]
  })
}
