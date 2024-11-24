const express = require("express");
const { getExercisesByLanguage } = require("../controllers/exercisesController");

const router = express.Router();

// Endpoint para obtener ejercicios por lengua
router.get("/:language", getExercisesByLanguage);

module.exports = router;
