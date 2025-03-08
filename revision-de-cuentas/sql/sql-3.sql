--Tabla entidades

CREATE TABLE entidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_entidad ENUM('persona', 'proveedor') NOT NULL,
    persona_id INT NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES personas(id)
);