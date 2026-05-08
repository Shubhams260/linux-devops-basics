const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "index.html"));
});

app.post("/submit", async (req, res) => {
    const { name, email, message } = req.body;

    try {
        const response = await fetch("http://backend:5000/submit", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: new URLSearchParams({
                name,
                email,
                message
            })
        });

        const data = await response.json();
        res.send(`Response from backend: ${JSON.stringify(data)}`);

    } catch (error) {
        res.send(`Error: ${error.message}`);
    }
});

app.listen(3000, () => {
    console.log("Frontend running on http://localhost:3000");
});