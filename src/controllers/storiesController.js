const { OpenAI } = require("openai");
require("dotenv").config(); 

const api = new OpenAI({
  apiKey: process.env.AI_API_KEY,
  baseURL: "https://api.aimlapi.com/v1", 
});

const generateStories = async (req, res) => {
  const { languageName } = req.body;

  if (!languageName) {
    return res.status(400).json({ error: "Se requiere el idioma seleccionado." });
  }

  try {
    // Generar 4 historias para el idioma que se selecciona
    const stories = [];
    for (let i = 0; i < 4; i++) {
      const completion = await api.chat.completions.create({
        model: "meta-llama/Meta-Llama-3-70B-Instruct-Turbo",
        messages: [
          {
            role: "system",
            content: `Eres una IA creadora de historias en base al idioma "${languageName}".`,
          },
          {
            role: "user",
            content: `Genera un título y un resumen corto de una historia en el idioma "${languageName}". Separa el título y el resumen claramente y responde solamente eso. y separado entre paréntesis traducelo en idioma español.`,
          },
        ],
        temperature: 0.7,
        max_tokens: 150,
      });

      // Obtiene el contenido del mensaje de la IA
      const storyContent = completion.choices[0].message.content;

      // Obtenemos el título y el resumen de la historia
      let summary = "Resumen no disponible";

      const titleMatch = storyContent.match(/"([^"]+)"/);
      const summaryMatch = storyContent.match(/Resumen:\s*(.+)$/i);
      if (summaryMatch) {
        summary = summaryMatch[1].trim();
      }

      // Verificar si existe el título
      const title = titleMatch ? titleMatch[1] : "Título no disponible";


      stories.push({ id: i + 1, title, summary });
    }

    res.json({
      success: true,
      languageName,
      stories,
    });
  } catch (error) {
    console.error("Error generando historias:", error);
    res.status(500).json({ error: "Hubo un problema al generar las historias." });
  }
};

module.exports = { generateStories };
