CREATE OR REPLACE VIEW ver_reportes AS
SELECT 
	r.id AS reporte_id,
	r.fecha,
	r.descripcion,
	r.nivel_prioridad,
	p.ubicacion AS pizarra,
	t.nombre AS tecnico
FROM reporte_fallos r
JOIN pizarras p ON r.pizarra_id = p.id
JOIN tecnicos t ON r.tecnico_id = t.id;