output "cluster_arn" {
  value = module.ecs_cluster.cluster_arn
}

output "execution_role_arn" {
  description = "ECS task execution role ARN"
  value       = module.ecs_execution_role.role_arn
}
