INSERT INTO Clientes (nombre, apellido, direccion, telefono, email) VALUES
('Juan', 'García', 'Calle Rivadavia 456, Buenos Aires', '+54 9 11 5555 1111', 'juan.garcia@example.com'),
('Luis', 'Martínez', 'Av. San Juan 789, Mendoza', '+54 9 261 444 6666', 'luis.martinez@example.com'),
('Martina', 'López', 'Calle Urquiza 321, Córdoba', '+54 9 351 777 9999', 'martina.lopez@example.com'),
('Pedro', 'Silva', 'Av. Pellegrini 987, Rosario', '+54 9 341 888 0000', 'pedro.silva@example.com'),
('Laura', 'Torres', 'Calle Sarmiento 654, Tucumán', '+54 9 381 333 2222', 'laura.torres@example.com'),
('Gonzalo', 'Díaz', 'Av. 9 de Julio 555, Buenos Aires', '+54 9 11 7777 8888', 'gonzalo.diaz@example.com'),
('Marcela', 'Romero', 'Calle Italia 147, Mendoza', '+54 9 261 999 8888', 'marcela.romero@example.com'),
('Diego', 'Ramírez', 'Av. Vélez Sarsfield 222, Córdoba', '+54 9 351 222 3333', 'diego.ramirez@example.com'),
('Carolina', 'Acosta', 'Calle Colón 789, Rosario', '+54 9 341 555 6666', 'carolina.acosta@example.com'),
('Ezequiel', 'Fernández', 'Av. Corrientes 987, Buenos Aires', '+54 9 11 6666 5555', 'ezequiel.fernandez@example.com');


INSERT INTO Tipo_Cobertura (nombre, descripcion) VALUES
('Seguro de Vida', 'Cobertura que protege a los beneficiarios en caso de fallecimiento del asegurado.'),
('Seguro de Automóvil', 'Cobertura que brinda protección contra daños a vehículos y responsabilidad civil.'),
('Seguro de Salud', 'Cobertura médica que ayuda a cubrir gastos de atención médica y hospitalaria.'),
('Seguro de Hogar', 'Cobertura que protege la vivienda y sus contenidos contra daños y robos.'),
('Seguro de Responsabilidad Civil', 'Cobertura que protege al asegurado en caso de daños a terceros.'),
('Seguro de Accidentes Personales', 'Cobertura que brinda protección en caso de accidentes que causen invalidez o fallecimiento.'),
('Seguro de Viaje', 'Cobertura que brinda asistencia en viajes, cubriendo gastos médicos y otros imprevistos.'),
('Seguro de Incendio', 'Cobertura que protege contra pérdidas por incendios en propiedades y bienes.'),
('Seguro de Responsabilidad Profesional', 'Cobertura que protege a profesionales en caso de demandas por errores u omisiones.'),
('Seguro de Equipos Electrónicos', 'Cobertura que protege equipos electrónicos contra daños y robos.');


INSERT INTO Polizas (numero_poliza, fecha_inicio, fecha_termino, monto_prima, cliente_id, tipo_cobertura_id) VALUES
('POL001', '2023-01-15', '2024-01-15', 500.00, 1, 1),
('POL002', '2023-02-01', '2024-02-01', 320.50, 2, 2),
('POL003', '2023-03-10', '2024-03-10', 650.75, 3, 3),
('POL004', '2023-04-05', '2024-04-05', 420.30, 4, 4),
('POL005', '2023-05-20', '2024-05-20', 280.25, 5, 5),
('POL006', '2023-06-12', '2024-06-12', 580.90, 6, 6),
('POL007', '2023-07-03', '2024-07-03', 450.60, 7, 7),
('POL008', '2023-08-25', '2024-08-25', 380.00, 8, 8),
('POL009', '2023-09-18', '2024-09-18', 520.20, 9, 9),
('POL010', '2023-10-30', '2024-10-30', 340.80, 10, 10);


INSERT INTO Siniestros (fecha, descripcion, poliza_id) VALUES
('2023-03-05', 'Choque de vehículos en intersección', 1),
('2023-04-12', 'Incendio en el hogar', 4),
('2023-05-20', 'Robo de equipo electrónico', 6),
('2023-06-15', 'Lesiones en accidente de tráfico', 2),
('2023-07-02', 'Daños en propiedad ajena', 9),
('2023-08-10', 'Fallecimiento del asegurado', 3),
('2023-09-18', 'Daños a terceros en accidente', 5),
('2023-10-22', 'Inundación en la propiedad', 8),
('2023-11-05', 'Responsabilidad profesional', 10),
('2023-12-30', 'Asistencia médica en viaje', 7);


INSERT INTO Pagos (fecha, monto, poliza_id) VALUES
('2023-01-10', 250.00, 1),
('2023-02-15', 180.50, 2),
('2023-03-20', 320.75, 3),
('2023-04-05', 200.30, 4),
('2023-05-22', 150.25, 5),
('2023-06-18', 280.90, 6),
('2023-07-10', 180.60, 7),
('2023-08-28', 150.00, 8),
('2023-09-20', 220.20, 9),
('2023-10-31', 140.80, 10);


INSERT INTO Agentes (nombre, apellido, fecha_nacimiento, direccion, telefono, email) VALUES
('María', 'González', '1985-03-12', 'Av. Libertador 567, Buenos Aires', '+54 9 11 2222 3333', 'maria.gonzalez@example.com'),
('Juan', 'Rodríguez', '1990-08-25', 'Calle San Martín 789, Córdoba', '+54 9 351 444 5555', 'juan.rodriguez@example.com'),
('Laura', 'Fernández', '1988-05-18', 'Av. Colón 321, Rosario', '+54 9 341 666 7777', 'laura.fernandez@example.com'),
('Diego', 'López', '1987-11-05', 'Calle Mitre 147, Mendoza', '+54 9 261 888 9999', 'diego.lopez@example.com'),
('Lucía', 'Martínez', '1992-01-30', 'Av. Sarmiento 987, Tucumán', '+54 9 381 222 1111', 'lucia.martinez@example.com'),
('Pablo', 'Gómez', '1989-09-22', 'Av. 9 de Julio 555, Buenos Aires', '+54 9 11 7777 8888', 'pablo.gomez@example.com'),
('Carolina', 'Pérez', '1993-06-10', 'Calle Italia 789, Mendoza', '+54 9 261 444 3333', 'carolina.perez@example.com'),
('Martín', 'Ramírez', '1986-04-15', 'Av. Vélez Sarsfield 222, Córdoba', '+54 9 351 777 6666', 'martin.ramirez@example.com'),
('Ana', 'Acosta', '1991-07-20', 'Calle Colón 555, Rosario', '+54 9 341 999 8888', 'ana.acosta@example.com'),
('Gonzalo', 'Torres', '1994-02-28', 'Av. Corrientes 987, Buenos Aires', '+54 9 11 6666 5555', 'gonzalo.torres@example.com');


INSERT INTO Compañias (nombre, direccion, telefono, email) VALUES
('Seguros Argentinos S.A.', 'Av. Libertador 1234, Buenos Aires', '+54 11 2222 3333', 'info@segurosargentinos.com'),
('Protección Seguros S.R.L.', 'Calle San Martín 567, Córdoba', '+54 351 444 5555', 'contacto@proteccionseguros.com'),
('Rosario Seguros', 'Av. Colón 789, Rosario', '+54 341 666 7777', 'info@rosarioseguros.com'),
('Mendozaseg S.A.', 'Calle Mitre 147, Mendoza', '+54 261 888 9999', 'contacto@mendozaseg.com'),
('Tucumán Seguros', 'Av. Sarmiento 987, Tucumán', '+54 381 222 1111', 'info@tucumanseguros.com'),
('SegurosBA', 'Av. 9 de Julio 555, Buenos Aires', '+54 11 7777 8888', 'info@segurosba.com'),
('Mendoza Protegida', 'Calle Italia 789, Mendoza', '+54 261 444 3333', 'contacto@mendozaprotegida.com'),
('Córdoba Insurance', 'Av. Vélez Sarsfield 222, Córdoba', '+54 351 777 6666', 'info@cordobainsurance.com'),
('Seguros Rosales', 'Calle Colón 555, Rosario', '+54 341 999 8888', 'info@segurosrosales.com'),
('Seguros del Plata', 'Av. Corrientes 987, Buenos Aires', '+54 11 6666 5555', 'contacto@segurosdelplata.com');


INSERT INTO Sucursales (nombre, direccion, telefono, email, compañia_id) VALUES
('Sucursal Buenos Aires', 'Av. Libertador 1234, Buenos Aires', '+54 11 2222 3333', 'buenosaires@sucursal.com', 1),
('Sucursal Córdoba', 'Calle San Martín 567, Córdoba', '+54 351 444 5555', 'cordoba@sucursal.com', 2),
('Sucursal Rosario', 'Av. Colón 789, Rosario', '+54 341 666 7777', 'rosario@sucursal.com', 3),
('Sucursal Mendoza', 'Calle Mitre 147, Mendoza', '+54 261 888 9999', 'mendoza@sucursal.com', 4),
('Sucursal Tucumán', 'Av. Sarmiento 987, Tucumán', '+54 381 222 1111', 'tucuman@sucursal.com', 5),
('Sucursal Buenos Aires', 'Av. 9 de Julio 555, Buenos Aires', '+54 11 7777 8888', 'buenosaires2@sucursal.com', 1),
('Sucursal Mendoza', 'Calle Italia 789, Mendoza', '+54 261 444 3333', 'mendoza2@sucursal.com', 4),
('Sucursal Córdoba', 'Av. Vélez Sarsfield 222, Córdoba', '+54 351 777 6666', 'cordoba2@sucursal.com', 2),
('Sucursal Rosario', 'Calle Colón 555, Rosario', '+54 341 999 8888', 'rosario2@sucursal.com', 3),
('Sucursal Buenos Aires', 'Av. Corrientes 987, Buenos Aires', '+54 11 6666 5555', 'buenosaires3@sucursal.com', 1);


INSERT INTO Ramos (nombre) VALUES
('Seguro de Vida'),
('Seguro de Automóvil'),
('Seguro de Salud'),
('Seguro de Hogar'),
('Seguro de Responsabilidad Civil'),
('Seguro de Accidentes Personales'),
('Seguro de Viaje'),
('Seguro de Incendio'),
('Seguro de Responsabilidad Profesional'),
('Seguro de Equipos Electrónicos');


INSERT INTO Polizas_Ramo (poliza_id, ramo_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(3, 5),
(4, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 3),
(10, 5);