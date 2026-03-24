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

--AFTER: Para garantizar que la pizarra cambie a 'En Reparación' solo si el reporte de fallo se guardó con éxito en el sistema
--FOR EACH ROW: Porque necesitamos procesar la lógica fila por fila para identificar de forma individual qué pizarra_id 
--específico acaba de reportar el fallo y actualizar únicamente esa