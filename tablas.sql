-- Script de creacion de tablas

-- Creadas por Martinez Alexis

CREATE DATABASE project_exilius;

USE project_exilius;

CREATE TABLE IF NOT EXISTS Ramos 
(
    id_ramo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Tipo_Cobertura 
(
    id_tipo_cobertura INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Compañias 
(
    id_compañia INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(120) UNIQUE
);

CREATE TABLE IF NOT EXISTS Sucursales 
(
    id_sucursal INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(120) UNIQUE,
    compañia_id INT,
    FOREIGN KEY (compañia_id) REFERENCES Compañias(id_compañia)
);

CREATE TABLE IF NOT EXISTS Coberturas 
(
    id_cobertura INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Beneficiarios 
(
    id_beneficiario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(120) UNIQUE
);

CREATE TABLE IF NOT EXISTS Clientes 
(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(120) UNIQUE
);

CREATE TABLE IF NOT EXISTS Agentes 
(
    id_agente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(120) UNIQUE
);

CREATE TABLE IF NOT EXISTS Polizas 
(
    id_poliza INT PRIMARY KEY AUTO_INCREMENT,
    numero_poliza VARCHAR(20) UNIQUE NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_termino DATE NOT NULL,
    monto_prima DECIMAL(10, 2) NOT NULL,
    cliente_id INT,
    tipo_cobertura_id INT,
    unidad_duracion VARCHAR(20),
    duracion INT,
    agente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (tipo_cobertura_id) REFERENCES Tipo_Cobertura(id_tipo_cobertura),
    FOREIGN KEY (agente_id) REFERENCES Agentes(id_agente)
);

CREATE TABLE IF NOT EXISTS Pagos 
(
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    poliza_id INT,
    FOREIGN KEY (poliza_id) REFERENCES Polizas(id_poliza)
);

CREATE TABLE IF NOT EXISTS Siniestros 
(
    id_siniestro INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    poliza_id INT,
    FOREIGN KEY (poliza_id) REFERENCES Polizas(id_poliza)
);

CREATE TABLE IF NOT EXISTS Coberturas_Poliza 
(
    poliza_id INT,
    cobertura_id INT,
    PRIMARY KEY (poliza_id, cobertura_id),
    FOREIGN KEY (poliza_id) REFERENCES Polizas(id_poliza),
    FOREIGN KEY (cobertura_id) REFERENCES Coberturas(id_cobertura)
);

CREATE TABLE IF NOT EXISTS Reclamaciones 
(
    id_reclamacion INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    poliza_id INT,
    FOREIGN KEY (poliza_id) REFERENCES Polizas(id_poliza)
);

CREATE TABLE IF NOT EXISTS Reclamaciones_Beneficiario 
(
    reclamacion_id INT,
    beneficiario_id INT,
    PRIMARY KEY (reclamacion_id, beneficiario_id),
    FOREIGN KEY (reclamacion_id) REFERENCES Reclamaciones(id_reclamacion),
    FOREIGN KEY (beneficiario_id) REFERENCES Beneficiarios(id_beneficiario)
);

CREATE TABLE IF NOT EXISTS Polizas_Ramo 
(
    poliza_id INT,
    ramo_id INT,
    PRIMARY KEY (poliza_id, ramo_id),
    FOREIGN KEY (poliza_id) REFERENCES Polizas(id_poliza),
    FOREIGN KEY (ramo_id) REFERENCES Ramos(id_ramo)
);

CREATE TABLE IF NOT EXISTS Polizas_Beneficiario 
(
    poliza_id INT,
    beneficiario_id INT,
    PRIMARY KEY (poliza_id, beneficiario_id),
    FOREIGN KEY (poliza_id) REFERENCES Polizas(id_poliza),
    FOREIGN KEY (beneficiario_id) REFERENCES Beneficiarios(id_beneficiario)
);
