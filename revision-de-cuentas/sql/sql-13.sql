--Creacion Indices
--CREATE INDEX idx_transacciones_cabecera ON transacciones_cabecera(id_transaccion);
CREATE INDEX idx_transacciones_fechas ON transacciones_cabecera(fecha_emision_factura, fecha_pago, fecha_facturacion);
CREATE INDEX idx_entidades_tipo ON entidades(tipo_entidad);