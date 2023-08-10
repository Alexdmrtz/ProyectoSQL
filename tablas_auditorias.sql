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
