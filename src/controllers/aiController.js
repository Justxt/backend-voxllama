const { OpenAI } = require("openai");
require("dotenv").config(); 

const api = new OpenAI({
  apiKey: process.env.AI_API_KEY, 
  baseURL: "https://api.aimlapi.com/v1", 
});

const generateAIResponse = async (req, res) => {
  const { prompt } = req.body;

  if (!prompt) {
    return res.status(400).json({ error: "Se requiere un mensaje" });
  }

  try {
    const completion = await api.chat.completions.create({
      model: "meta-llama/Meta-Llama-3-70B-Instruct-Turbo",
      messages: [
        {
          role: "system",
          content: "Eres una IA simuladora lingüística. Sé útil y consciente del contexto.",
        },
        {
          role: "user",
          content: prompt,
        },
      ],
      temperature: 0.7,
      max_tokens: 256,
    });

    const aiResponse = completion.choices[0].message.content;

    res.status(200).json({ prompt, aiResponse });
  } catch (error) {
    console.error("Error generando respuesta de IA:", error);
    res.status(500).json({ error: "Hubo un problema al generar la respuesta." });
  }
};

module.exports = { generateAIResponse };
