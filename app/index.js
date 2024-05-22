const express = require("express");
const app = express();

// middleware for matching content-type: application/json in http request header
app.use(express.json());

// rest api endpoints
const router = require("./routes/route");
app.use(router);

module.exports = app;
