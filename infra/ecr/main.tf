module "ecr_fe" {
  source = "../../tf_modules/ecr-repo"
  name   = var.repo_fe
}

module "ecr_be" {
  source = "../../tf_modules/ecr-repo"
  name   = var.repo_be
}

module "ecr_auth" {
  source = "../../tf_modules/ecr-repo"
  name   = var.repo_auth
}

module "ecr_payments" {
  source = "../../tf_modules/ecr-repo"
  name   = var.repo_payments
}

