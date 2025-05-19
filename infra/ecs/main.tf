module "ecs_cluster" {
  source       = "../../tf_modules/ecs-cluster"
  cluster_name = var.cluster_name
}

module "auth_service" {
  source             = "../../tf_modules/ecs-task-service"
  service_name       = "auth"
  image              = "872515289516.dkr.ecr.us-east-1.amazonaws.com/fullstack-auth:${var.image_tag}"
  container_port     = 8081
  cpu                = "256"
  memory             = "512"
  execution_role_arn = var.execution_role_arn
  cluster_arn        = module.ecs_cluster.cluster_arn
  subnet_ids         = var.subnet_ids
  security_group_id  = var.security_group_id
}

module "payments_service" {
  source             = "../../tf_modules/ecs-task-service"
  service_name       = "payments"
  image              = "872515289516.dkr.ecr.us-east-1.amazonaws.com/fullstack-payments:${var.image_tag}"
  container_port     = 8082
  cpu                = "256"
  memory             = "512"
  execution_role_arn = var.execution_role_arn
  cluster_arn        = module.ecs_cluster.cluster_arn
  subnet_ids         = var.subnet_ids
  security_group_id  = var.security_group_id
}
