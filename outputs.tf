#Displays the name of the cluster.
output "aws_ecs_cluster" {
  value       = aws_ecs_cluster.ecs_cluster.name
  description = "The name of the cluster"
}

#Compute serverless engine for ECS.
output "aws_ecs_cluster_capacity_providers" {
  value       = aws_ecs_cluster_capacity_providers.ecs_cluster_providers.capacity_providers
  description = "Compute serverless engine for ECS"
}

