ALTER TABLE reporte_fallos ADD COLUMN tecnico_id INTEGER;

ALTER TABLE reporte_fallos
ADD CONSTRAINT fk_tecnico_reporte
FOREIGN KEY (tecnico_id)
REFERENCES tecnicos (id)
ON DELETE SET NULL;