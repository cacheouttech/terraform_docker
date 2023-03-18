# Pulls the image
resource "docker_image" "ubuntu" {
  name = "ubuntu:latest"
}

#Create an ECS Cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs-cluster"
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_providers" {
  cluster_name = aws_ecs_cluster.ecs_cluster.name

  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

#Create ECS Service
resource "aws_ecs_service" "ecs_service" {
  name            = "centos"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  
  network_configuration {
    subnets         = [aws_subnet.private_subnet.id]
  }
}

#Tasks definitions
resource "aws_ecs_task_definition" "ecs_task" {
  family                     = "service"
  network_mode               = "awsvpc"
  requires_compatibilities   = ["FARGATE"]
  cpu                        = 512
  memory                     = 2048
  container_definitions      = jsonencode([
    {
      "name"                 : "centos",
      "image"                : "centos:8",
      "cpu"                  : 256,
      "memory"               : 512,
      "portMappings" : [
        {
          "containerPort"    : 80,
          "hostPort"         : 80
        }
      ]
    }
  ])
}

#Create S3 Bucket
resource "aws_s3_bucket" "state" {
  bucket = "terraformdockerbucket"

  # Prevents S3 Bucket Deletion
  lifecycle {
    prevent_destroy = true
  }
}























