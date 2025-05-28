-- ============================================================
-- Laboratorio 3 - Base de Datos 1
-- Dulce Ambrosio - 231143
-- Daniel Chet - 231177
-- ============================================================
DROP VIEW IF EXISTS vista_renta_detallada;
DROP TABLE IF EXISTS inventario;
DROP TABLE IF EXISTS renta;
DROP TABLE IF EXISTS detalle_renta;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS instrumento;
-- ---------------------------
-- 1. Tipos y dominios personalizados
-- ---------------------------
CREATE DOMAIN dinero NUMERIC(10,2) CHECK (VALUE >= 0);

CREATE TYPE estado_instrumento_enum AS ENUM ('Disponible', 'Rentado', 'Mantenimiento');
CREATE TYPE estado_renta_enum AS ENUM ('Activa', 'Finalizada', 'Cancelada');
CREATE TYPE tipo_instrumentos AS ENUM ('Viento', 'Metal', 'Percusión', 'Cuerdas', 'Electrofonos');

COMMENT ON DOMAIN dinero IS 'Valores monetarios >= 0 con 2 decimales';
COMMENT ON TYPE estado_instrumento_enum IS 'Estado físico del instrumento';
COMMENT ON TYPE estado_renta_enum IS 'Estado general de una renta (activa, finalizada, cancelada)';
-- ---------------------------
-- 2. DDL
-- ---------------------------

CREATE TABLE instrumento (
    id_instrumento        SERIAL PRIMARY KEY,
    nombre_instrumento    VARCHAR(100) NOT NULL,
    tipo_instrumento      tipo_instrumentos NOT NULL,
    marca                 VARCHAR(50),
    estado                estado_instrumento_enum NOT NULL DEFAULT 'Disponible',
    precio_renta          dinero NOT NULL
);

CREATE TABLE cliente (
    id_cliente       SERIAL PRIMARY KEY,
    nombre_cliente   VARCHAR(100) NOT NULL,
    correo           VARCHAR(150) NOT NULL UNIQUE,
    telefono         VARCHAR(20),
    direccion        VARCHAR(200)
);

CREATE TABLE detalle_renta (
    id_detalleRenta     SERIAL PRIMARY KEY,
    fecha_adquisición   DATE NOT NULL,
    fecha_devolucion    DATE NOT NULL CHECK (fecha_devolucion >= fecha_adquisición),
    estado_renta        estado_renta_enum NOT NULL,
    monto_total         dinero NOT NULL
);

CREATE TABLE renta (
    id_renta         SERIAL PRIMARY KEY,
    id_instrumento   INTEGER NOT NULL,
    id_cliente       INTEGER NOT NULL,
    id_detalleRenta  INTEGER NOT NULL,

    CONSTRAINT fk_renta_instrumento FOREIGN KEY (id_instrumento)
        REFERENCES instrumento(id_instrumento)
        ON DELETE RESTRICT,

    CONSTRAINT fk_renta_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
        ON DELETE RESTRICT,

    CONSTRAINT fk_renta_detalle FOREIGN KEY (id_detalleRenta)
        REFERENCES detalle_renta(id_detalleRenta)
        ON DELETE CASCADE
);

CREATE TABLE inventario (
    id_inventario     SERIAL PRIMARY KEY,
    id_instrumento    INTEGER NOT NULL,
    cant_instrumento  INTEGER NOT NULL CHECK (cant_instrumento >= 0),

    CONSTRAINT fk_inventario_instrumento FOREIGN KEY (id_instrumento)
        REFERENCES instrumento(id_instrumento)
        ON DELETE CASCADE,

    CONSTRAINT unique_instrumento_inventario UNIQUE (id_instrumento)
);

-- ---------------------------
-- 3. Vista general
-- ---------------------------
CREATE VIEW vista_renta_detallada AS
SELECT r.id_renta,
       i.nombre_instrumento,
       i.tipo_instrumento,
       c.nombre_cliente,
       dr.fecha_adquisición,
       dr.fecha_devolucion,
       dr.estado_renta,
       dr.monto_total
FROM   renta r
JOIN   instrumento i ON r.id_instrumento = i.id_instrumento
JOIN   cliente c ON r.id_cliente = c.id_cliente
JOIN   detalle_renta dr ON r.id_detalleRenta = dr.id_detalleRenta;

SELECT * FROM vista_renta_detallada;