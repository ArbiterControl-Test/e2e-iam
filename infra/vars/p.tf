variable "p" {
  type = string
}

resource "aws_iam_policy" "p" {
  name   = "e2e-p"
  policy = var.p
}
