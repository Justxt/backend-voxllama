create database voxLlamaBd;
USE voxLlamaBd;

CREATE TABLE languages (
    languages_Id INT AUTO_INCREMENT PRIMARY KEY,
    languages_Nombre VARCHAR(100) NOT NULL,
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

DELIMITER //
CREATE PROCEDURE pro_Mostrar_languages()
BEGIN
    SELECT languages_Id, languages_Nombre, languages_Descripcion, languages_threat_level
    FROM languages;
END //
DELIMITER ;
