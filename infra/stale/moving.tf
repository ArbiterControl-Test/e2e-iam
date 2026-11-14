# Synthetic fixture (PLAN-208, iam suite): TF21 moves this file on main, then restores it (moved by run 20261114T030827Z-e1b0a26b-c61a47ab65c6)
resource "aws_iam_role" "stale" {
  name               = "e2e-stale"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "sts:AssumeRole", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}
