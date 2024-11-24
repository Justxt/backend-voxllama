const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");

const languagesRoutes = require("./routes/languages");

const app = express(); 

// Middlewares
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Registrar rutas
app.use("/api/languages", languagesRoutes);

module.exports = app; 
