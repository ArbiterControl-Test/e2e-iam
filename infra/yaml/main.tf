# Synthetic fixture (PLAN-208, iam suite): a policy read from YAML
resource "aws_iam_role" "yaml" {
  name               = "e2e-yaml"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "sts:AssumeRole", Principal = { Service = "ec2.amazonaws.com" } }]
  })
}

resource "aws_iam_role_policy" "yaml" {
  name   = "yaml"
  role   = aws_iam_role.yaml.id
  policy = jsonencode(yamldecode(file("${path.module}/roles.yaml")))
}
