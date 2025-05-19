variable "service_name" {}
variable "image" {}
variable "container_port" {}
variable "cpu" { default = "256" }
variable "memory" { default = "512" }
variable "execution_role_arn" {}
variable "cluster_arn" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_id" {}
