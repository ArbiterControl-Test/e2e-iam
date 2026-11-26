# Synthetic fixture (PLAN-208, iam suite): resources that name a role
resource "aws_lambda_function" "fn" {
  function_name = "e2e-fn"
  role          = "arn:aws:iam::111122223333:role/e2e-fn"
  handler       = "index.handler"
  runtime       = "nodejs20.x"
  filename      = "fn.zip"
}

resource "aws_redshift_cluster" "warehouse" {
  cluster_identifier = "e2e-warehouse"
  node_type          = "dc2.large"
  iam_roles          = ["arn:aws:iam::111122223333:role/e2e-other"]
}
