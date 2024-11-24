create database voxLlamaBd;
USE voxLlamaBd;

CREATE TABLE languages (
    languages_Id INT AUTO_INCREMENT PRIMARY KEY,
    languages_Nombre VARCHAR(100) NOT NULL unique,
    languages_Descripcion TEXT,
    languages_threat_level VARCHAR(50) NOT NULL
);

INSERT INTO languages (languages_Nombre, languages_Descripcion, languages_threat_level)
VALUES
('Nivaclé', 'Una lengua hablada por comunidades indígenas en Paraguay, con menos de 15,000 hablantes activos.', 'En peligro'),
('Ainu', 'Lengua indígena de Japón considerada críticamente amenazada, con solo unos pocos hablantes nativos vivos.', 'Crítico'),
('Wichí Lhamtés Güisnay', 'Lengua hablada por comunidades indígenas del Gran Chaco argentino, utilizada en áreas rurales y con bajo número de hablantes jóvenes.', 'Vulnerable'),
('Zapoteco de San Felipe Tejalápam', 'Una variante de las lenguas zapotecas en México, con un número de hablantes decreciente.', 'En peligro'),
('Cornish', 'Lengua celta de Cornualles, Reino Unido, que se está revitalizando tras ser declarada extinta en el siglo XVIII.', 'Revitalización'),
('Guaraní', 'Lengua indígena de Paraguay que, aunque oficial, enfrenta retos por el desplazamiento hacia el español en áreas urbanas.', 'Vulnerable'),
('Koro', 'Una lengua tibeto-birmana descubierta en 2008 en la India, hablada por menos de 1,500 personas.', 'Crítico');

create table exercises (
	exercises_id INT AUTO_INCREMENT PRIMARY KEY,
    languages_id INT NOT NULL,
    exercises_pregunta TEXT NOT NULL,
    exercises_respuesta_correcta TEXT NOT NULL,
    exercises_distractores JSON NOT NULL,
    exercises_contexto TEXT,
    FOREIGN KEY (languages_id) REFERENCES languages(languages_Id)
);

INSERT INTO exercises (languages_id, exercises_pregunta, exercises_respuesta_correcta, exercises_distractores, exercises_contexto)
VALUES
-- Datos para Nivaclé
(1, '¿Cómo se dice "Gracias" en Nivaclé?', 'Ñandejara', '["Takiji", "Irankarapte", "Mba’éichapa"]', 'Se utiliza al agradecer en reuniones comunitarias.'),
(1, '¿Cómo se dice "Bienvenido" en Nivaclé?', 'Takiji', '["Ñandejara", "Irankarapte", "Jajotopata"]', 'Usado para dar la bienvenida en eventos formales.'),
(1, '¿Cómo se dice "Hola" en Nivaclé?', 'Takayai', '["Ñandejara", "Hosh", "Irankarapte"]', 'Forma común de saludo en la comunidad Nivaclé.'),
(1, '¿Qué significa "Ñandejara"?', 'Gracias', '["Hola", "Adiós", "Amigo"]', 'Expresión utilizada para mostrar gratitud.'),

-- Datos para Ainu
(2, '¿Cómo se dice "Amigo" en Ainu?', 'Hosh', '["Ñandejara", "Takiji", "Irankarapte"]', 'La palabra refleja la importancia de la amistad en la cultura Ainu.'),
(2, '¿Qué significa "Irankarapte"?', 'Buenos días', '["Gracias", "Adiós", "Hola"]', 'Expresión usada para saludar en las mañanas con respeto.'),
(2, '¿Cómo se dice "Gracias" en Ainu?', 'Iyairaykere', '["Irankarapte", "Takiji", "Ñandejara"]', 'Palabra de gratitud utilizada en la cultura Ainu.'),
(2, '¿Qué significa "Iyairaykere"?', 'Gracias', '["Hola", "Amigo", "Adiós"]', 'Utilizada para agradecer en ceremonias y reuniones.'),

-- Datos para Wichí Lhamtés Güisnay
(3, '¿Cómo se dice "Casa" en Wichí?', 'Chotaye', '["Ñandejara", "Takiji", "Iyairaykere"]', 'Palabra usada para referirse a una vivienda en áreas rurales.'),
(3, '¿Qué significa "Chotaye"?', 'Casa', '["Hola", "Amigo", "Gracias"]', 'Termino comúnmente utilizado en el día a día.'),
(3, '¿Cómo se dice "Gracias" en Wichí?', 'Tapirne', '["Chotaye", "Irankarapte", "Hosh"]', 'Expresión utilizada para mostrar gratitud.'),

-- Datos para Zapoteco de San Felipe Tejalápam
(4, '¿Cómo se dice "Hola" en Zapoteco?', 'Rata', '["Jajotopata", "Ñandejara", "Takiji"]', 'Forma común de saludo entre comunidades zapotecas.'),
(4, '¿Qué significa "Rata"?', 'Hola', '["Adiós", "Amigo", "Gracias"]', 'Expresión para iniciar una conversación.'),
(4, '¿Cómo se dice "Adiós" en Zapoteco?', 'Ixca', '["Takiji", "Iyairaykere", "Hosh"]', 'Se usa al despedirse de manera respetuosa.'),

-- Datos para Cornish
(5, '¿Cómo se dice "Buenos días" en Cornish?', 'Dydh da', '["Ñandejara", "Takiji", "Irankarapte"]', 'Frase utilizada por las mañanas en la región de Cornualles.'),
(5, '¿Qué significa "Dydh da"?', 'Buenos días', '["Hola", "Amigo", "Adiós"]', 'Expresión usada en interacciones diarias en Cornualles.'),
(5, '¿Cómo se dice "Gracias" en Cornish?', 'Meur ras', '["Iyairaykere", "Takiji", "Ñandejara"]', 'Se usa para expresar gratitud.'),

-- Datos para Guaraní
(6, '¿Cómo se dice "Hola" en Guaraní?', 'Mba’éichapa', '["Ñandejara", "Takiji", "Irankarapte"]', 'Forma común de saludo en Paraguay.'),
(6, '¿Qué significa "Jajotopata"?', 'Adiós', '["Gracias", "Hola", "Amigo"]', 'Expresión utilizada al despedirse.'),
(6, '¿Cómo se dice "Gracias" en Guaraní?', 'Aguyje', '["Irankarapte", "Takiji", "Ñandejara"]', 'Palabra de gratitud ampliamente utilizada en Paraguay.'),

-- Datos para Koro
(7, '¿Cómo se dice "Río" en Koro?', 'Khusa', '["Ñandejara", "Hosh", "Rata"]', 'Palabra usada para referirse a los ríos en la región.'),
(7, '¿Qué significa "Khusa"?', 'Río', '["Amigo", "Gracias", "Adiós"]', 'Elemento clave en la vida diaria de los hablantes de Koro.'),
(7, '¿Cómo se dice "Montaña" en Koro?', 'Lunga', '["Khusa", "Takiji", "Iyairaykere"]', 'Palabra usada para describir el entorno montañoso de la región.');


DELIMITER //
CREATE PROCEDURE pro_Mostrar_languages()
BEGIN
    SELECT languages_Id, languages_Nombre, languages_Descripcion, languages_threat_level
    FROM languages;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE pro_Mostrar_Ejercicios_Por_lengua
	(
		IN nombre_lengua VARCHAR(100)
    )
BEGIN
    SELECT 
        e.exercises_pregunta AS pregunta,
        e.exercises_respuesta_correcta AS respuesta_correcta,
        JSON_UNQUOTE(e.exercises_distractores) AS distractores, 
        e.exercises_contexto AS contexto
    FROM 
        exercises e
    INNER JOIN 
        languages l ON e.languages_id = l.languages_Id
    WHERE 
        l.languages_Nombre = nombre_lengua;
END //

DELIMITER ;




