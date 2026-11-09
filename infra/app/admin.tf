resource "aws_iam_role_policy_attachment" "admin" {
  role       = aws_iam_role.app.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
