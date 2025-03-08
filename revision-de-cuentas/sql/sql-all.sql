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

CREATE TABLE proveedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    persona_id INT NOT NULL,
    cuit VARCHAR(20) UNIQUE,
    observaciones TEXT,
    FOREIGN KEY (persona_id) REFERENCES personas(id)
);

CREATE TABLE entidades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_entidad ENUM('persona', 'proveedor') NOT NULL,
    persona_id INT NOT NULL,
    FOREIGN KEY (persona_id) REFERENCES personas(id)
);

CREATE TABLE operacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('ingreso', 'egreso') NOT NULL
);

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

CREATE TABLE metodo_pago (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(100) NOT NULL,
    observaciones TEXT
);

CREATE TABLE tipo_moneda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    moneda VARCHAR(3) NOT NULL DEFAULT 'ARS',
    observaciones TEXT
);

CREATE TABLE metodo_pago_transaccion_detalle (
    id INT PRIMARY KEY AUTO_INCREMENT,
    metodo_pago_id INT NOT NULL,
    tipo_moneda_id INT NOT NULL,
    FOREIGN KEY (metodo_pago_id) REFERENCES metodo_pago(id),
    FOREIGN KEY (tipo_moneda_id) REFERENCES tipo_moneda(id)
);

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

CREATE TABLE roles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_rol VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT,
    observaciones TEXT
);

CREATE TABLE usuarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT,
    password VARCHAR(255) NOT NULL,
    persona_id INT NOT NULL,
    rol_id INT NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (persona_id) REFERENCES personas(id),
    FOREIGN KEY (rol_id) REFERENCES roles(id)
);

CREATE TABLE archivos_adjuntos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    transacciones_detalle_id INT NOT NULL,
    nombre_archivo VARCHAR(255) NOT NULL,
    tipo_archivo VARCHAR(50),
    ruta VARCHAR(255) NOT NULL,
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (transacciones_detalle_id) REFERENCES transacciones_detalle(id)
);

CREATE INDEX idx_transacciones_fechas ON transacciones_cabecera(fecha_emision_factura, fecha_pago, fecha_facturacion);
CREATE INDEX idx_entidades_tipo ON entidades(tipo_entidad);