const express = require("express");
const { generateStories } = require("../controllers/storiesController");

const router = express.Router();

router.post("/generate-stories", generateStories);

module.exports = router;
