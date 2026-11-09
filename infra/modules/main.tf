# Synthetic fixture (PLAN-208, iam suite): a registry module call
module "role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.39.0"

  role_name   = "e2e-module"
  create_role = true
}
