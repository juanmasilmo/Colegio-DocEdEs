--Tabla proveedores

CREATE TABLE proveedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL,
    cuit VARCHAR(20) UNIQUE,
    observaciones TEXT,
    FOREIGN KEY (persona_id) REFERENCES personas(id)
);