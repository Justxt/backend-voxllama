const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");

const languagesRoutes = require("./routes/languages");
const exercisesRoutes = require("./routes/exercises");
const aiRoutes = require("./routes/ai");
const storiesRoutes = require("./routes/stories");
const usersRoutes = require("./routes/users");

const app = express(); 

// Middlewares
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Registrar rutas
app.use("/api/languages", languagesRoutes);
app.use("/api/exercises", exercisesRoutes);
app.use("/api/ai", aiRoutes);
app.use("/api/stories", storiesRoutes);
app.use("/api/users", usersRoutes );

module.exports = app; 
