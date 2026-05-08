output "frontend_ecr_repository_url" {
  description = "Frontend ECR repository URL"
  value       = aws_ecr_repository.frontend_repo.repository_url
}

output "backend_ecr_repository_url" {
  description = "Backend ECR repository URL"
  value       = aws_ecr_repository.backend_repo.repository_url
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main_cluster.name
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = aws_lb.app_alb.dns_name
}

output "frontend_url" {
  description = "Frontend URL through ALB"
  value       = "http://${aws_lb.app_alb.dns_name}"
}

output "backend_url_note" {
  description = "Backend is routed using /api/* or /backend/* path rule"
  value       = "Backend target group is attached to the same ALB using path-based routing"
}