# Synthetic fixture (PLAN-208, iam suite): closed, narrow IAM only
resource "aws_iam_role" "narrow" {
  name               = "e2e-narrow"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "sts:AssumeRole", Principal = { Service = "ec2.amazonaws.com" } }]
  })
  tags               = { purpose = "e2e-tf17" }
}

resource "aws_iam_role_policy" "narrow" {
  name = "narrow"
  role = aws_iam_role.narrow.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "s3:GetObject", Resource = "arn:aws:s3:::e2e-iam-bucket/*" }]
  })
}
