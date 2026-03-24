-- especialidades
INSERT INTO especialidades (nombre) VALUES
('Soporte Multimedia'),
('Mantenimiento de Infraestructura'),
('Carpintería y Estructuras');

--tecnicos
INSERT INTO tecnicos (nombre, especialidad_id) VALUES
('Ana Martínez', 1),
('Carlos Ramírez', 2),
('Luis Fernández', 3);

-- pizarras 
INSERT INTO pizarras (ubicacion, estado) VALUES
('Aula 101', 'Operativa'),
('Laboratorio B', 'En Reparacion'),
('Aula 205', 'Operativa'),
('Auditorio Principal', 'Fuera de Servicio');