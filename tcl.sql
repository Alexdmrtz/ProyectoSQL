DELIMITER $$

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