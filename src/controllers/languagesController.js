const db = require("../config/db");

const getLanguages = (req, res) => {
  const query = "CALL pro_Mostrar_languages()"; 

  db.query(query, (err, results) => {
    if (err) {
      console.error("Error ejecutando el procedimiento almacenado:", err);
      return res.status(500).json({ error: "Error obteniendo las lenguas" });
    }
    res.json(results[0]); 
  });
};

module.exports = { getLanguages };
