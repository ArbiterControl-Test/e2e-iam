# Synthetic fixture (PLAN-208, iam suite): a registry module given a policy file
module "custom" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "5.39.0"

  name        = "e2e-custom"
  policy_file = "${path.root}/custom/admin.json"
}
