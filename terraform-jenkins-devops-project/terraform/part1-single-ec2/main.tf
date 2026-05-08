provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "single_ec2_sg" {
  name        = "terraform-single-ec2-sg"
  description = "Allow SSH, Flask and Express access"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Flask backend access"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Express frontend access"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
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
    Name    = "terraform-single-ec2-sg"
    Project = "Terraform Jenkins DevOps Project"
  }
}

resource "aws_instance" "single_ec2" {
  ami                    = "ami-0f918f7e67a3323f0"
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.single_ec2_sg.id]

  user_data = file("user-data.sh")

  tags = {
    Name    = "terraform-single-ec2-flask-express"
    Project = "Terraform Jenkins DevOps Project"
  }
}