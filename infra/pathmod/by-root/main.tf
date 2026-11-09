resource "aws_iam_policy" "by_root" {
  name   = "e2e-by-root"
  policy = file("${path.root}/policy.json")
}
