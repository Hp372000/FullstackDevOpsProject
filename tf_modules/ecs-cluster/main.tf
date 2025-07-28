resource "aws_ecs_cluster" "this" {
  name = var.cluster_name
}

module "network" {
  source              = "../../tf_modules/vpc-basic"
  name                = "fullstack"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}
