#!/bin/bash

apt update -y
apt install -y python3 python3-flask git

mkdir -p /home/ubuntu/flask-backend
cd /home/ubuntu/flask-backend

cat > app.py <<'EOF'
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({"message": "Flask Backend Running on Separate EC2 using Terraform"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF

chown -R ubuntu:ubuntu /home/ubuntu/flask-backend

sudo -u ubuntu nohup python3 app.py > /home/ubuntu/flask-backend/flask.log 2>&1 &