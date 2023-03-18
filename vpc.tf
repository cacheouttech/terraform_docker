#Create VPC for ECS Service
resource "aws_vpc" "ecs_vpc" {
  cidr_block = var.cidr

  tags = {
    Name = "ecs-vpc"
  }
}

#Create a Private subnet for VPC
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.ecs_vpc.id
  cidr_block        = var.private_cidr
  availability_zone = var.az_region

  tags = {
    Name = "private-subnet"
  }
}
