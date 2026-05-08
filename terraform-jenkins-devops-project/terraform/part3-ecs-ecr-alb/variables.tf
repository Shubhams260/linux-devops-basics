variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  default     = "terraform-ecs-devops"
}

variable "frontend_image" {
  description = "Frontend Docker image URI from ECR"
  type        = string
}

variable "backend_image" {
  description = "Backend Docker image URI from ECR"
  type        = string
}