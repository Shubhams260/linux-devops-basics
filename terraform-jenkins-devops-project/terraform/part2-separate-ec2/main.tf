provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "backend_sg" {
  name        = "terraform-backend-ec2-sg"
  description = "Allow Flask backend access"

  ingress {
    description = "Flask backend access"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "terraform-backend-ec2-sg"
    Project = "Terraform Jenkins DevOps Project"
  }
}

resource "aws_security_group" "frontend_sg" {
  name        = "terraform-frontend-ec2-sg"
  description = "Allow Express frontend access"

  ingress {
    description = "Express frontend access"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "terraform-frontend-ec2-sg"
    Project = "Terraform Jenkins DevOps Project"
  }
}

resource "aws_instance" "backend_ec2" {
  ami                    = "ami-0f918f7e67a3323f0"
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.backend_sg.id]

  user_data = file("backend-user-data.sh")

  tags = {
    Name    = "terraform-flask-backend-ec2"
    Project = "Terraform Jenkins DevOps Project"
  }
}

resource "aws_instance" "frontend_ec2" {
  ami                    = "ami-0f918f7e67a3323f0"
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]

  user_data = file("frontend-user-data.sh")

  tags = {
    Name    = "terraform-express-frontend-ec2"
    Project = "Terraform Jenkins DevOps Project"
  }
}