# 🚀 Node + Flask DevOps Deployment Project

## 📌 Overview
This project demonstrates deployment of a full-stack application using AWS EC2.

- Frontend: Node.js
- Backend: Flask (Python)
- Deployment: AWS EC2

---

## 🧩 Project Structure

node-flask-docker-compose/
├── backend/
├── frontend/
├── aws-deployment/
│   ├── part1-single-ec2/
│   └── part2-two-ec2/
├── docker-compose.yml
└── README.md

---

## 🏗️ Architecture

### Part 1: Single EC2 Deployment
Both frontend and backend are deployed on a single EC2 instance.

User → EC2 → Frontend + Backend

Details:
aws-deployment/part1-single-ec2/part1-single-ec2.md

---

### Part 2: Two EC2 Deployment
Frontend and backend are deployed on separate EC2 instances.

User → Frontend EC2 → Backend EC2

Details:
aws-deployment/part2-two-ec2/part2-two-ec2.md

---

## ⚙️ Tech Stack
- AWS EC2
- Node.js
- Python (Flask)
- Linux (Ubuntu)
- Git & GitHub

---

## 🧪 Features
- Form submission from frontend to backend
- REST API communication
- Multi-instance deployment
- Real-world debugging scenarios

---

## 📌 Key Learnings
- EC2 instance setup and deployment
- Security Groups configuration
- Public vs Private IP usage
- Cross-instance communication
- Debugging network and port issues
- Structuring production-like projects

---

## 🛑 Note
This project uses development servers for learning purposes.

For production environments, use:
- NGINX
- Load Balancer
- HTTPS (SSL)
- Process managers (PM2 / Gunicorn)

---

## 👨‍💻 Author
Shubham Singh
