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

