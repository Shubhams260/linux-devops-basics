#!/bin/bash

apt update -y
apt install -y nodejs npm git

mkdir -p /home/ubuntu/express-frontend
cd /home/ubuntu/express-frontend

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
  res.send("<h1>Express Frontend Running on Separate EC2 using Terraform</h1><p>Flask backend is running separately on port 5000.</p>");
});

app.listen(3000, "0.0.0.0", () => {
  console.log("Express frontend running on port 3000");
});
EOF

npm install

chown -R ubuntu:ubuntu /home/ubuntu/express-frontend

sudo -u ubuntu nohup node server.js > /home/ubuntu/express-frontend/express.log 2>&1 &