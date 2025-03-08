--Tabla personas

CREATE TABLE personas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    dni VARCHAR(20) UNIQUE,
    telefono VARCHAR(20),
    id_localidad INT,
    mail VARCHAR(100),
    cuil VARCHAR(20),
    observaciones TEXT,
    domicilio VARCHAR(200)
);