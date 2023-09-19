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

--Script de creacion de tablas de auditorias


--Tabla de Auditoría para la Tabla "Clientes"

--Esta tabla almacenará los registros de auditoría para los cambios realizados en la tabla "Clientes". Incluirá información sobre el tipo de acción (inserción, actualización, eliminación), la fecha y hora de la acción, y los detalles de los campos modificados.

CREATE TABLE IF NOT EXISTS AuditoriaClientes (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    accion VARCHAR(20) NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    detalles TEXT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);


--Tabla de Auditoría para la Tabla "Polizas"

--Esta tabla de auditoría registrará los cambios realizados en la tabla "Polizas". Al igual que la tabla anterior, almacenará detalles sobre el tipo de acción, la fecha y hora, y los campos modificados.

CREATE TABLE IF NOT EXISTS AuditoriaPolizas (
    id_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    id_poliza INT,
    accion VARCHAR(20) NOT NULL,
    fecha_hora TIMESTAMP NOT NULL,
    detalles TEXT,
    FOREIGN KEY (id_poliza) REFERENCES Polizas(id_poliza)
);


--Script de funcion para calcular el iva 

DELIMITER $$

-- Función para calcular el IVA de una póliza

-- Esta función acepta como parámetro el id_poliza y obtiene el monto de la prima de la póliza correspondiente. Luego, calcula el IVA aplicando un 21% sobre el monto de la prima y lo devuelve como resultado.

CREATE FUNCTION CalcularIVA(poliza_id INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE monto DECIMAL(10, 2);
    DECLARE iva DECIMAL(10, 2);
    SELECT monto_prima INTO monto FROM Polizas WHERE id_poliza = poliza_id;
    SET iva = monto * 0.21; 
    RETURN iva;
END$$

DELIMITER ;



-- Función para calcular el período de cobertura

-- Esta función acepta tres parámetros: fecha_inicio que representa la fecha de inicio de la póliza, duracion que es la cantidad de días, meses o años que dura la cobertura, y unidad que especifica si la duración está en días, meses o años.

DELIMITER $$

CREATE FUNCTION CalcularPeriodoCobertura(fecha_inicio DATE, duracion INT, unidad VARCHAR(10)) 
RETURNS DATE
DETERMINISTIC
BEGIN
    DECLARE fecha_termino DATE;
    
    IF unidad = 'dias' THEN
        SET fecha_termino = DATE_ADD(fecha_inicio, INTERVAL duracion DAY);
    ELSEIF unidad = 'meses' THEN
        SET fecha_termino = DATE_ADD(fecha_inicio, INTERVAL duracion MONTH);
    ELSEIF unidad = 'años' THEN
        SET fecha_termino = DATE_ADD(fecha_inicio, INTERVAL duracion YEAR);
    ELSE
        -- Opción inválida, devolver NULL o un valor por defecto según el caso.
        RETURN NULL;
    END IF;
    
    RETURN fecha_termino;
END$$


DELIMITER ;


--Scrip del SP 

-- Stored Procedure 1: Ordenar Tabla
-- Este SP aceptará el nombre de una tabla, el campo de ordenamiento y la dirección del orden (ascendente o descendente) como parámetros, y devolverá los registros ordenados.

DELIMITER $$

CREATE PROCEDURE OrdenarTabla(IN tabla_nombre VARCHAR(50), IN ordenar_por VARCHAR(50), IN orden VARCHAR(4))
BEGIN
    SET @sql_query = CONCAT('SELECT * FROM ', tabla_nombre, ' ORDER BY ', ordenar_por, ' ', orden);
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$


DELIMITER ;


-- Stored Procedure 2: Insertar Registro
-- Permite insertar un nuevo registro en una tabla especificada de la base de datos (en este caso, principalmente en la tabla "Clientes") utilizando valores proporcionados como parámetros. El uso de la consulta SQL dinámica permite adaptarse a diferentes tablas y columnas sin necesidad de escribir consultas separadas para cada caso.

DELIMITER $$

CREATE PROCEDURE InsertarRegistro(
    IN tabla_nombre VARCHAR(50),
    -- Agregar los parámetros correspondientes a las columnas de la tabla
    -- Por ejemplo, para la tabla Clientes:
    IN cliente_nombre VARCHAR(50),
    IN cliente_apellido VARCHAR(50),
    IN cliente_direccion VARCHAR(100),
    IN cliente_telefono VARCHAR(20),
    IN cliente_email VARCHAR(120)
)
BEGIN
    SET @sql_query = CONCAT('INSERT INTO ', tabla_nombre, ' VALUES (');
    
    -- Agregar los valores correspondientes a los parámetros
    IF tabla_nombre = 'Clientes' THEN
        SET @sql_query = CONCAT(@sql_query, "NULL, '", cliente_nombre, "', '", cliente_apellido, "', '", cliente_direccion, "', '", cliente_telefono, "', '", cliente_email, "')");
    -- Agregar otros IF para cada tabla
        
    END IF;
    
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END$$


DELIMITER ;


CREATE PROCEDURE ProcessOrders()
BEGIN
    DECLARE is_empty BOOLEAN;

    -- Verificar si la tabla Polizas está vacía
    SELECT COUNT(*) = 0 INTO is_empty FROM Polizas;

    -- Iniciar una transacción
    START TRANSACTION;

    -- Eliminar registros si no está vacía.
    IF NOT is_empty THEN
        DELETE FROM Polizas WHERE fecha_termino < CURDATE() LIMIT 2;
        SELECT "Se eliminaron registros de la tabla Polizas." AS Message;
    ELSE
        -- Insertar registros si está vacía.
        INSERT INTO Polizas (numero_poliza, fecha_inicio, fecha_termino, monto_prima, cliente_id, tipo_cobertura_id) 
        VALUES 
            ('NuevoNumeroPoliza1', '2023-08-01', '2024-08-01', 1000.00, 1, 1),
            ('NuevoNumeroPoliza2', '2023-09-01', '2024-09-01', 1200.00, 2, 2);
        SELECT "Se insertaron registros en la tabla Polizas." AS Message;
    END IF;

    -- Confirmar o deshacer la transacción
    
    -- ROLLBACK;
    -- COMMIT;
END;
$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE ProcessSiniestros()
BEGIN
    -- Iniciar una transacción
    START TRANSACTION;

    -- Insertar ocho nuevos registros en la tabla Siniestros
    INSERT INTO Siniestros (fecha, descripcion, poliza_id)
    VALUES 
        ('2023-08-15', 'Colisión de vehículo', 1),
        ('2023-08-20', 'Daño por tormenta', 2),
        ('2023-09-02', 'Robo de propiedad', 1),
        ('2023-09-05', 'Daño por vandalismo', 2),
        ('2023-09-10', 'Incendio en vivienda', 3),
        ('2023-09-12', 'Accidente de tráfico', 4),
        ('2023-09-18', 'Fuga de agua', 5),
        ('2023-09-20', 'Rotura de cristal', 6);

    -- Crear un savepoint después del cuarto siniestro
    SAVEPOINT savepoint_4;

    -- Crear un savepoint después del octavo siniestro
    SAVEPOINT savepoint_8;

    -- Eliminar el savepoint de los primeros cuatro siniestros (comentar para mantener)
    -- RELEASE SAVEPOINT savepoint_4;

    -- Confirmar o deshacer la transacción
    
    -- ROLLBACK;
    -- COMMIT;
END;
$$

DELIMITER ;


--Scripts de creacion de los triggers


--Trigger para Imprimir Mensaje en Consola en Tabla "AuditoriaClientes"

--Este trigger se encarga de registrar una auditoría cada vez que se inserta un nuevo cliente en la tabla "Clientes". Guarda la acción de inserción, el mensaje de auditoría (que contiene el nombre y apellido del cliente) y la fecha y hora en la que se realizó la inserción en la tabla de auditoría "AuditoriaClientes".

DELIMITER $$

CREATE TRIGGER AfterInsertClienteAudit
AFTER INSERT ON Clientes
FOR EACH ROW
BEGIN
    SET @mensaje = CONCAT('Nuevo cliente insertado: ', NEW.nombre, ' ', NEW.apellido);
    
    INSERT INTO AuditoriaClientes (id_cliente, accion, fecha_hora, detalles)
    VALUES (NEW.id_cliente, 'Inserción con Mensaje de Auditoría', NOW(), @mensaje);
END$$


DELIMITER ;


--Trigger para  calcular automáticamente la fecha de término de una póliza en función de la fecha de inicio

--Este trigger realiza el cálculo automático de la fecha de término de una póliza en función de la fecha de inicio, la duración y la unidad de duración proporcionadas durante la inserción. Luego, registra la acción de inserción en la tabla de auditoría "AuditoriaPolizas".

DELIMITER $$

CREATE TRIGGER BeforeInsertPolizaAudit
BEFORE INSERT ON Polizas
FOR EACH ROW
BEGIN
    DECLARE fecha_termino DATE;
    
    IF NEW.fecha_inicio IS NOT NULL AND NEW.duracion IS NOT NULL AND NEW.unidad_duracion IS NOT NULL THEN
        IF NEW.unidad_duracion = 'dias' THEN
            SET fecha_termino = DATE_ADD(NEW.fecha_inicio, INTERVAL NEW.duracion DAY);
        ELSEIF NEW.unidad_duracion = 'meses' THEN
            SET fecha_termino = DATE_ADD(NEW.fecha_inicio, INTERVAL NEW.duracion MONTH);
        ELSEIF NEW.unidad_duracion = 'años' THEN
            SET fecha_termino = DATE_ADD(NEW.fecha_inicio, INTERVAL NEW.duracion YEAR);
        END IF;
        
        SET NEW.fecha_termino = fecha_termino;
        
        INSERT INTO AuditoriaPolizas (id_poliza, accion, fecha_hora, detalles)
        VALUES (NEW.id_poliza, 'Inserción con Fecha de Término Calculada', NOW(), NULL);
    END IF;
END$$


DELIMITER ;


--Scrip de creacion de las vistas

--Vista de Clientes con sus Pólizas

--Esta vista mostrará información detallada de los clientes y las pólizas que tienen contratadas.

CREATE OR REPLACE VIEW VistaClientesConPolizas AS
SELECT c.id_cliente, c.nombre, c.apellido, c.direccion, c.telefono, c.email,
       p.id_poliza, p.numero_poliza, p.fecha_inicio, p.fecha_termino, p.monto_prima
FROM Clientes c
LEFT JOIN Polizas p ON c.id_cliente = p.cliente_id;

--Vista de Pólizas con sus Clientes y Siniestros

--Esta vista mostrará información detallada de las pólizas, los clientes asociados y los siniestros relacionados con cada póliza.

CREATE OR REPLACE VIEW VistaPolizasConClientesYSiniestros AS
SELECT p.id_poliza, p.numero_poliza, p.fecha_inicio, p.fecha_termino, p.monto_prima,
       c.id_cliente, c.nombre AS nombre_cliente, c.apellido AS apellido_cliente,
       s.id_siniestro, s.fecha, s.descripcion
FROM Polizas p
LEFT JOIN Clientes c ON p.cliente_id = c.id_cliente
LEFT JOIN Siniestros s ON p.id_poliza = s.poliza_id;


--Vista de Siniestros con sus Clientes y Pólizas

--Esta vista mostrará información detallada de los siniestros, los clientes asociados y las pólizas relacionadas con cada siniestro.

CREATE OR REPLACE VIEW  VistaSiniestrosConClientesYPolizas AS
SELECT s.id_siniestro, s.fecha, s.descripcion,
       c.id_cliente, c.nombre AS nombre_cliente, c.apellido AS apellido_cliente,
       p.id_poliza, p.numero_poliza, p.fecha_inicio, p.fecha_termino, p.monto_prima
FROM Siniestros s
LEFT JOIN Polizas p ON s.poliza_id = p.id_poliza
LEFT JOIN Clientes c ON p.cliente_id = c.id_cliente;

--Vista de Pagos con detalles de la Póliza

--Esta vista mostrará información completa sobre los pagos realizados y los detalles de la póliza asociada a cada pago.

CREATE OR REPLACE VIEW VistaPagosConDetallesPoliza AS
SELECT pa.id_pago, pa.fecha, pa.monto,
       po.id_poliza, po.numero_poliza, po.fecha_inicio, po.fecha_termino, po.monto_prima,
       c.id_cliente, c.nombre AS nombre_cliente, c.apellido AS apellido_cliente
FROM Pagos pa
LEFT JOIN Polizas po ON pa.poliza_id = po.id_poliza
LEFT JOIN Clientes c ON po.cliente_id = c.id_cliente;

--Vista de Agentes con información de sus Pólizas

--Esta vista mostrará información completa sobre los agentes y las pólizas que tienen asignadas.

CREATE OR REPLACE VIEW  VistaAgentesConPolizas AS
SELECT a.id_agente, a.nombre, a.apellido, a.fecha_nacimiento, a.direccion, a.telefono, a.email,
       po.id_poliza, po.numero_poliza, po.fecha_inicio, po.fecha_termino, po.monto_prima,
       c.nombre AS nombre_cliente, c.apellido AS apellido_cliente
FROM Agentes a
LEFT JOIN Polizas po ON a.id_agente = po.agente_id
LEFT JOIN Clientes c ON po.cliente_id = c.id_cliente;