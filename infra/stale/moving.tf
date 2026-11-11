# Synthetic fixture (PLAN-208, iam suite): TF21 moves this file on main, then restores it
resource "aws_iam_role" "stale" {
  name               = "e2e-stale"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "sts:AssumeRole", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}
