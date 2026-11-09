# Synthetic fixture (PLAN-208, iam suite): a role beside the Deny
resource "aws_iam_role" "guarded" {
  name               = "e2e-guarded"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "sts:AssumeRole", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}

resource "aws_iam_role_policy_attachment" "guard" {
  role       = aws_iam_role.guarded.name
  policy_arn = aws_iam_policy.guard.arn
}
