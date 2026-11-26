resource "aws_iam_role_policy_attachment" "custom" {
  role       = aws_iam_role.app.name
  policy_arn = "arn:aws:iam::111122223333:policy/e2e-custom"
}
