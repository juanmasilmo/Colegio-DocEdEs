--Tabla archivos_adjuntos

CREATE TABLE archivos_adjuntos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    transacciones_detalle_id INT NOT NULL,
    nombre_archivo VARCHAR(255) NOT NULL,
    tipo_archivo VARCHAR(50),
    ruta VARCHAR(255) NOT NULL,
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (transacciones_detalle_id) REFERENCES transacciones_detalle(id)
);