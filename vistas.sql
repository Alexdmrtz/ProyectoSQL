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
