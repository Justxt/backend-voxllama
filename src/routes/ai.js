const express = require("express");
const { generateAIResponse } = require("../controllers/aiController");

const router = express.Router();

router.post("/response", generateAIResponse);

module.exports = router;
