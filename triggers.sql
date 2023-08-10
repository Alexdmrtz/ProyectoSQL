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
