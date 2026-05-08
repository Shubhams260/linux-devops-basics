#!/bin/bash

sudo apt update -y
sudo apt install -y python3 python3-pip python3-venv nodejs npm git

mkdir -p /home/ubuntu/devops-app
cd /home/ubuntu/devops-app

cat > app.py <<'EOF'
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({"message": "Flask Backend Running on EC2 using Terraform"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF

cat > requirements.txt <<'EOF'
flask
EOF

pip3 install -r requirements.txt --break-system-packages

nohup python3 app.py > flask.log 2>&1 &

cat > package.json <<'EOF'
{
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "^4.18.2"
  }
}
EOF

cat > server.js <<'EOF'
const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("<h1>Express Frontend Running on EC2 using Terraform</h1><p>Backend is running on port 5000.</p>");
});

app.listen(3000, "0.0.0.0", () => {
  console.log("Express frontend running on port 3000");
});
EOF

npm install

nohup node server.js > express.log 2>&1 &