module "ecs_cluster" {
  source       = "../../tf_modules/ecs-cluster"
  cluster_name = var.cluster_name
}

module "auth_service" {
  source               = "../../tf_modules/ecs-task-service"
  family               = "auth-task"
  cpu                  = "256"
  memory               = "512"
  execution_role_arn   = var.execution_role_arn
  container_name       = "auth"
  image_url            = "872515289516.dkr.ecr.us-east-1.amazonaws.com/fullstack-auth:${var.image_tag}"
  container_port       = 8081
  service_name         = "auth-service"
  cluster_id           = module.ecs_cluster.cluster_id
  desired_count        = 1
  subnet_ids           = var.subnet_ids
  security_group_ids   = var.security_group_ids
}

module "payments_service" {
  source               = "../../tf_modules/ecs-task-service"
  family               = "payments-task"
  cpu                  = "256"
  memory               = "512"
  execution_role_arn   = var.execution_role_arn
  container_name       = "payments"
  image_url            = "872515289516.dkr.ecr.us-east-1.amazonaws.com/fullstack-payments:${var.image_tag}"
  container_port       = 8082
  service_name         = "payments-service"
  cluster_id           = module.ecs_cluster.cluster_id
  desired_count        = 1
  subnet_ids           = var.subnet_ids
  security_group_ids   = var.security_group_ids
}

module "ecs_task_service" {
  source = "../../tf_modules/ecs-task-service"

  family              = "fullstack-backend-task"
  cpu                 = "256"
  memory              = "512"
  execution_role_arn  = var.execution_role_arn
  container_name      = "backend"
  image_url           = "${var.ecr_repo_url}:latest"
  container_port      = 8080
  service_name        = "backend-service"
  cluster_id          = module.ecs_cluster.cluster_id
  desired_count       = 1
  subnet_ids          = var.subnet_ids
  security_group_ids  = var.security_group_ids
}
