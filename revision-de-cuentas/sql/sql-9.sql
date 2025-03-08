--Tabla metodo_pago_transaccion_detalle

CREATE TABLE transacciones_detalle (
    id INT PRIMARY KEY AUTO_INCREMENT,
    transaccion_cabecera_id INT NOT NULL,
    descripcion TEXT,
    monto DECIMAL(12, 2),
    precio_unitario DECIMAL(12, 2),
    porcentaje_impuesto DECIMAL(5, 2),
    monto_impuesto DECIMAL(12, 2),
    monto_total_linea DECIMAL(12, 2),
    metodo_pago_transaccion_detalle_id INT,
    FOREIGN KEY (transaccion_cabecera_id) REFERENCES transacciones_cabecera(id),
    FOREIGN KEY (metodo_pago_transaccion_detalle_id) REFERENCES metodo_pago_transaccion_detalle(id)
);
