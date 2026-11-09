# Synthetic fixture (PLAN-208, iam suite): local modules that load policy files
module "by_module" {
  source = "./by-module"
}

module "by_root" {
  source = "./by-root"
}
