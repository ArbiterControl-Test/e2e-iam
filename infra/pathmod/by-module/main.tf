resource "aws_iam_policy" "by_module" {
  name   = "e2e-by-module"
  policy = file("policy.json")
}
