# Synthetic fixture (PLAN-208, iam suite): TF21 moves this file on main, then restores it (moved by run 20261111T172353Z-f2cfcda7-195f94130d2a)
resource "aws_iam_role" "stale" {
  name               = "e2e-stale"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "sts:AssumeRole", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}
