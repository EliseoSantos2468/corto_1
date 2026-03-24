CREATE OR REPLACE FUNCTION cambio_estado()
RETURNS TRIGGER AS $$
DECLARE
	estado_actual VARCHAR(50);
BEGIN

	SELECT estado INTO estado_actual FROM pizarras WHERE id = NEW.pizarra_id;
	
	IF estado_actual != 'En Reparacion' THEN 
		UPDATE pizarras SET estado = 'En Reparacion' WHERE id = NEW.pizarra_id; 
	ELSE
		RAISE NOTICE 'La pizarra ya está En Reparacion';
	END IF;
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_cambio_estado
AFTER INSERT ON reporte_fallos
FOR EACH ROW
EXECUTE PROCEDURE cambio_estado();