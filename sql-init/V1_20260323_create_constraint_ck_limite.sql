ALTER TABLE reporte_fallos ADD COLUMN nivel_prioridad NUMERIC(1,0);

ALTER TABLE reporte_fallos
ADD CONSTRAINT ck_limite 
CHECK (nivel_prioridad BETWEEN 1 AND 5);