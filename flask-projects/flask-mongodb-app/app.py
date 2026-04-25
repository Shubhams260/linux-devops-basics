from flask import Flask, jsonify, render_template, request, redirect, url_for
import json
import os
from pymongo import MongoClient
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

app = Flask(__name__)

# MongoDB connection
mongo_uri = os.getenv("MONGO_URI")
client = MongoClient(mongo_uri)
db = client["flask_db"]
collection = db["users"]

# Home route (form)
@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == "POST":
        try:
            name = request.form["name"]
            email = request.form["email"]
            message = request.form["message"]

            # Insert into MongoDB
            collection.insert_one({
                "name": name,
                "email": email,
                "message": message
            })

            return redirect(url_for("success"))

        except Exception as e:
            return render_template("index.html", error=str(e))

    return render_template("index.html")

# Success page
@app.route("/success")
def success():
    return render_template("success.html")

# API route (existing)
@app.route("/api")
def get_data():
    try:
        with open("data/items.json", "r") as file:
            data = json.load(file)
        return jsonify(data)
    except Exception as e:
        return jsonify({"error": str(e)})

if __name__ == "__main__":
    app.run(debug=True, use_reloader=False)