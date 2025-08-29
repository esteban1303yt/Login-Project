-- DROP DATABASE register_store;
CREATE DATABASE IF NOT EXISTS register_store;
USE register_store;

-- Crear tabla personas
CREATE TABLE personas(
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    tipo_identificacion VARCHAR(50),
    nuip INT,
    email VARCHAR(100),
    clave VARCHAR(500),
    nombre_artesano VARCHAR(100),
    salario DECIMAL(10,2),
    fecha_registro DATE DEFAULT (CURRENT_DATE),
    imagen LONGBLOB
);

-- Ver los registros actuales de la tabla personas
SELECT * FROM personas;

-- Crear tabla usuarios
CREATE TABLE usuarios(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    clave VARCHAR(500),
    nombre_artesano VARCHAR(100),
    rol ENUM('cliente', 'admin', 'super_usuario') DEFAULT 'cliente',
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM usuarios;

-- Crear tabla productos con campo stock calculado
CREATE TABLE productos(
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    categoria VARCHAR(100),
    entradas INT DEFAULT 0,
    salidas INT DEFAULT 0,
    stock INT AS (entradas - salidas) VIRTUAL,
    precio DECIMAL(10,2) NOT NULL,
    imagen LONGBLOB,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Ver los registros actuales de la tabla de productos
SELECT * FROM productos;