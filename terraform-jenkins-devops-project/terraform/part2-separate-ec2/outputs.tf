output "backend_public_ip" {
  description = "Public IP address of Flask backend EC2"
  value       = aws_instance.backend_ec2.public_ip
}

output "frontend_public_ip" {
  description = "Public IP address of Express frontend EC2"
  value       = aws_instance.frontend_ec2.public_ip
}

output "flask_backend_url" {
  description = "Flask backend URL"
  value       = "http://${aws_instance.backend_ec2.public_ip}:5000"
}

output "express_frontend_url" {
  description = "Express frontend URL"
  value       = "http://${aws_instance.frontend_ec2.public_ip}:3000"
}