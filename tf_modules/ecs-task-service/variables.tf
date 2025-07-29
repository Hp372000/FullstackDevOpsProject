variable "family" {}
variable "cpu" {}
variable "memory" {}
variable "execution_role_arn" {}
variable "container_name" {}
variable "image_url" {}
variable "container_port" {}
variable "service_name" {}
variable "cluster_id" {}
variable "desired_count" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}

