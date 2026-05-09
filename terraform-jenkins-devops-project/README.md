# Terraform Jenkins DevOps Project

This repository contains hands-on DevOps infrastructure deployment projects using Terraform, AWS EC2, ECS Fargate, ECR, Application Load Balancer (ALB), and Docker.

The project demonstrates Infrastructure as Code (IaC) practices by provisioning complete cloud infrastructure using Terraform and deploying frontend/backend applications on AWS.

---

# Project Structure

```bash
terraform-jenkins-devops-project/
│
├── terraform/
│   ├── part1-single-ec2/
│   ├── part2-separate-ec2/
│   └── part3-ecs-ecr-alb/
│
├── screenshots/
│   ├── terraform/
│   └── jenkins/
│
├── apps/
├── jenkins-cicd/
└── README.md
```

---

# Technologies Used

- Terraform
- AWS EC2
- AWS ECS Fargate
- AWS ECR
- AWS Application Load Balancer (ALB)
- AWS CloudWatch
- Docker
- Node.js
- Flask
- Git & GitHub

---

# Project Parts

## Part 1 - Single EC2 Deployment

Frontend and backend applications are deployed on a single EC2 instance using Terraform.

### Features
- EC2 provisioning using Terraform
- Security Group configuration
- Express frontend deployment
- Flask backend deployment
- Public access testing

### Folder
```bash
terraform/part1-single-ec2/
```

---

## Part 2 - Separate EC2 Deployment

Frontend and backend applications are deployed on separate EC2 instances using Terraform.

### Features
- Separate frontend and backend EC2 instances
- Individual security groups
- Independent application deployment
- Frontend-backend communication
- Infrastructure provisioning using Terraform

### Folder
```bash
terraform/part2-separate-ec2/
```

---

## Part 3 - ECS + ECR + ALB Deployment

Containerized frontend and backend applications are deployed on AWS ECS Fargate using Terraform.

### Features
- Docker containerization
- AWS ECR repositories
- ECS Cluster creation
- ECS Fargate services
- Application Load Balancer
- CloudWatch log groups
- VPC, Subnets, Internet Gateway
- Terraform Infrastructure as Code

### Folder
```bash
terraform/part3-ecs-ecr-alb/
```

---

# Screenshots

Deployment screenshots and outputs are available inside:

```bash
screenshots/
```

The screenshots include:
- Terraform plan/apply outputs
- EC2 instance deployment
- ECS services and tasks
- ECR repositories
- ALB configuration
- Target groups
- CloudWatch logs
- Application testing

---

# Learning Outcomes

This project helped in understanding:

- Infrastructure as Code (IaC)
- Terraform workflows
- AWS networking
- ECS Fargate deployments
- Docker image management
- Application Load Balancer configuration
- Security group configuration
- Cloud infrastructure automation
- DevOps deployment practices

---

# Author

Shubham Singh

## Webhook Trigger Testing