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
