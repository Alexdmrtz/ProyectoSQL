--Script de funcion para calcular el iva 

DELIMITER $$

-- Función para calcular el IVA de una póliza

-- Esta función acepta como parámetro el id_poliza y obtiene el monto de la prima de la póliza correspondiente. Luego, calcula el IVA aplicando un 16% sobre el monto de la prima y lo devuelve como resultado.

CREATE FUNCTION CalcularIVA(poliza_id INT) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    DECLARE monto DECIMAL(10, 2);
    DECLARE iva DECIMAL(10, 2);
    SELECT monto_prima INTO monto FROM Polizas WHERE id_poliza = poliza_id;
    SET iva = monto * 0.21; 
    RETURN iva;
END$$

DELIMITER ;