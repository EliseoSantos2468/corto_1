ALTER TABLE pizarras ADD CONSTRAINT ck_pizarras_estado 
CHECK (estado IN (
	'Operativa',
	'En Reparacion',
	'Fuera de Servicio'
));