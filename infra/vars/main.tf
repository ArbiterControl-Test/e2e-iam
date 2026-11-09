# Synthetic fixture (PLAN-208, iam suite): variable-fed IAM
variable "actions" {
  type    = list(string)
  default = ["s3:GetObject"]
}
variable "enabled" {
  type    = bool
  default = false
}

resource "aws_iam_role" "vars" {
  name               = "e2e-vars"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "sts:AssumeRole", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}

resource "aws_iam_role_policy" "fed" {
  name = "fed"
  role = aws_iam_role.vars.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = var.actions, Resource = "arn:aws:s3:::e2e-iam-bucket/*" }]
  })
}

resource "aws_iam_role_policy" "dormant" {
  count = var.enabled ? 1 : 0
  name  = "dormant"
  role  = aws_iam_role.vars.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "*", Resource = "arn:aws:s3:::e2e-iam-bucket/*" }]
  })
}
