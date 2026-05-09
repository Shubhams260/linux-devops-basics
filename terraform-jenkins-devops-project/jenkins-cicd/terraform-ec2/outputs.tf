output "instance_id" {
  value = aws_instance.jenkins_ec2.id
}

output "public_ip" {
  value = aws_instance.jenkins_ec2.public_ip
}

output "public_dns" {
  value = aws_instance.jenkins_ec2.public_dns
}

output "ssh_command" {
  value = "ssh -i jenkins-cicd-key.pem ubuntu@${aws_instance.jenkins_ec2.public_ip}"
}

output "jenkins_url" {
  value = "http://${aws_instance.jenkins_ec2.public_ip}:8080"
}

output "flask_url" {
  value = "http://${aws_instance.jenkins_ec2.public_ip}:5000"
}

output "express_url" {
  value = "http://${aws_instance.jenkins_ec2.public_ip}:3000"
}