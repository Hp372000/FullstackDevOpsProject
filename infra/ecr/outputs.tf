output "ecr_urls" {
  value = {
    frontend = module.ecr_fe.repository_url
    backend  = module.ecr_be.repository_url
    auth     = module.ecr_auth.repository_url
    payments = module.ecr_payments.repository_url
  }
}
