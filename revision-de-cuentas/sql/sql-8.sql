--Tabla metodo_pago_transaccion_detalle

CREATE TABLE metodo_pago_transaccion_detalle (
    id INT PRIMARY KEY AUTO_INCREMENT,
    metodo_pago_id INT NOT NULL,
    tipo_moneda_id INT NOT NULL,
    FOREIGN KEY (metodo_pago_id) REFERENCES metodo_pago(id),
    FOREIGN KEY (tipo_moneda_id) REFERENCES tipo_moneda(id)
);