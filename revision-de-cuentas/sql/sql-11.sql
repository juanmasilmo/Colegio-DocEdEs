--Tabla usuarios

CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT,
    password VARCHAR(255) NOT NULL,
    persona_id INT NOT NULL,
    rol_id INT NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (persona_id) REFERENCES personas(id),
    FOREIGN KEY (rol_id) REFERENCES roles(id)
);