ALTER TABLE reporte_fallos ADD COLUMN pizarra_id INTEGER NOT NULL;

ALTER TABLE reporte_fallos
ADD CONSTRAINT fk_pizarra_reporte
FOREIGN KEY (pizarra_id) 
REFERENCES pizarras (id)
ON DELETE CASCADE;