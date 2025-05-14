variable "cluster_name" {
  default = "fullstack-devops-cluster"
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  default     = "latest" # or override via terraform.tfvars
}

variable "execution_role_arn" {
  description = "ECS task execution role ARN"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for ECS task networking"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group for ECS tasks"
  type        = string
}

