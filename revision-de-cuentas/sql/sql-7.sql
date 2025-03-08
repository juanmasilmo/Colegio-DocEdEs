--Tabla tipo_moneda

CREATE TABLE tipo_moneda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    moneda VARCHAR(3) NOT NULL DEFAULT 'ARS',
    observaciones TEXT
);