const db = require("../config/db");

/**
 * Controlador para registrar un usuario.
 */
const registerUser = (req, res) => {
  const { nombre, email, password } = req.body;

  if (!nombre || !email || !password) {
    return res.status(400).json({ message: "Todos los campos son obligatorios." });
  }

  const query = "CALL pro_Registrar_Usuario(?, ?, ?)";
  db.query(query, [nombre, email, password], (err) => {
    if (err) {
      if (err.sqlState === "45000") {
        return res.status(400).json({ message: err.sqlMessage }); 
      }
      console.error("Error al registrar usuario:", err);
      return res.status(500).json({ error: "Error al registrar el usuario." });
    }

    res.status(201).json({ message: "Usuario registrado con éxito." });
  });
};

/**
 * Controlador para loguear un usuario.
 */
const loginUser = (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: "Todos los campos son obligatorios." });
  }

  const query = "CALL pro_Autenticar_Usuario(?, ?)";
  db.query(query, [email, password], (err, results) => {
    if (err) {
      if (err.sqlState === "45000") {
        return res.status(400).json({ message: err.sqlMessage }); 
      }
      console.error("Error al autenticar usuario:", err);
      return res.status(500).json({ error: "Error al autenticar el usuario." });
    }

    if (results[0].length === 0) {
      return res.status(404).json({ message: "Usuario no encontrado o contraseña incorrecta." });
    }

    const user = results[0][0];
    res.status(200).json({
      message: "Login exitoso.",
      user: {
        id: user.user_id,
        nombre: user.user_nombre,
        email: user.user_email,
      },
    });
  });
};

module.exports = { registerUser, loginUser };
