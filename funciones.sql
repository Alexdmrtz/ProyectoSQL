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
