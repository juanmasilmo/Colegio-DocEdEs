--Tabla transacciones_cabecera

CREATE TABLE transacciones_cabecera (
    id INT PRIMARY KEY AUTO_INCREMENT,
    operacion_id INT NOT NULL,
    numero_factura VARCHAR(50),
    fecha_emision_factura DATE,
    fecha_facturacion DATE,
    fecha_pago DATE,
    entidad_id INT NOT NULL,
    estado ENUM('pendiente', 'pagado', 'cancelado') NOT NULL DEFAULT 'pendiente',
    observaciones TEXT,
    archivo_adjunto VARCHAR(255),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (operacion_id) REFERENCES operacion(id),
    FOREIGN KEY (entidad_id) REFERENCES entidades(id)
);