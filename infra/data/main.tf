# Synthetic fixture (PLAN-208, iam suite): a managed policy read by name
data "aws_iam_policy" "managed" {
  name = "ReadOnlyAccess"
}

resource "aws_iam_role" "data" {
  name               = "e2e-data"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "sts:AssumeRole", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}

resource "aws_iam_role_policy_attachment" "managed" {
  role       = aws_iam_role.data.name
  policy_arn = data.aws_iam_policy.managed.arn
}
