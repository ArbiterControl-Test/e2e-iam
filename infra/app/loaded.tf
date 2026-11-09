# Synthetic fixture (PLAN-208, iam suite): a policy document loaded from a file
resource "aws_iam_policy" "loaded" {
  name   = "e2e-loaded"
  policy = file("${path.module}/policy.json")
}
