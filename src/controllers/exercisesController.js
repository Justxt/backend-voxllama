const db = require("../config/db");

/**
 * Función auxiliar para parsear los distractores de forma segura.
 * @param {string} distractoresJSON - Cadena JSON de distractores.
 * @returns {Array} - Array de distractores.
 */
const parseDistractores = (distractoresJSON) => {
  try {
    return JSON.parse(distractoresJSON || "[]");
  } catch (error) {
    console.warn("Error parseando los distractores:", error);
    return []; 
  }
};

/**
 * Endpoint para obtener ejercicios por idioma.
 */
const getExercisesByLanguage = (req, res) => {
  const { language } = req.params;

  db.query("CALL pro_Mostrar_Ejercicios_Por_lengua(?)", [language], (err, results) => {
    if (err) {
      console.error("Error ejecutando el procedimiento almacenado:", err);
      return res.status(500).json({ error: "Error al obtener los ejercicios" });
    }

    const ejercicios = results[0] || [];
    if (ejercicios.length === 0) {
      return res.status(404).json({ message: `No se encontraron ejercicios para la lengua: ${language}` });
    }

    const formattedExercises = ejercicios.map((exercise) => ({
      pregunta: exercise.pregunta,
      respuesta_correcta: exercise.respuesta_correcta,
      distractores: parseDistractores(exercise.distractores),
      contexto: exercise.contexto
    }));

    res.json(formattedExercises);
  });
};

module.exports = { getExercisesByLanguage };
