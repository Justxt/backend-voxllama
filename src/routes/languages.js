const express = require("express");
const { getLanguages } = require("../controllers/languagesController");

const router = express.Router();

// Endpoint para obtener las lenguas
router.get("/", getLanguages);

module.exports = router;
