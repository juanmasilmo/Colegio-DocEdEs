--Tabla operacion

CREATE TABLE operacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('ingreso', 'egreso') NOT NULL
);