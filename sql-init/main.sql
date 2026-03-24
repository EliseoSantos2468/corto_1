--  Módulo 1
-- 2.1 creacion de base de datos 
\i docker-entrypoint-initdb.d/V1_20260323_create_table_pizarras.sql

-- Creacion del check de estado de las pizarras
\i docker-entrypoint-initdb.d/V1_20260323_create_constraint_ck_pizarras_estado.sql

-- Creacion de la tabla especialidades
\i docker-entrypoint-initdb.d/V1_20260323_create_table_especialidades.sql

-- Creacion de la tabla tecnicos
\i docker-entrypoint-initdb.d/V1_20260323_create_table_tecnicos.sql

-- Creacion de la tabla reporte_fallos
\i docker-entrypoint-initdb.d/V1_20260323_create_table_reporte_fallos.sql

-- 2.2. Integridad Referencial

--relacion entre pizarra y reporte respetando la regla de propagacion al eliminar
\i docker-entrypoint-initdb.d/V1_20260323_create_reference_pizarra_reporte.sql

--relacion entre tecnico y reporte respetando la regla de anulacion al eliminar
\i docker-entrypoint-initdb.d/V1_20260323_create_reference_tecnico_reporte.sql

-- 2.3 Automatización mediante Triggers y PL/pgSQL
\i docker-entrypoint-initdb.d/V1_20260323_create_trigger_cambio_estado.sql

--AFTER: Para garantizar que la pizarra cambie a 'En Reparación' solo si el reporte de fallo se guardó con éxito en el sistema
--FOR EACH ROW: Porque necesitamos procesar la lógica fila por fila para identificar de forma individual qué pizarra_id 
--específico acaba de reportar el fallo y actualizar únicamente esa

-- Módulo 2: Modificación y Evolución del Esquema

--3.1. Alteración de Tablas (ALTER TABLE)
-- Creacion del check de limite del nivel de prioridad
\i docker-entrypoint-initdb.d/V1_20260323_create_constraint_ck_limite.sql

--3.2. Optimización mediante Índices (Diseño Físico)
-- Creacion del indice para la fecha de los reportes
\i docker-entrypoint-initdb.d/V1_20260323_create_index_fecha_reportes.sql

---- Los índices actúan como "atajos" físicos que permiten al motor encontrar datos al instante (Index Scan) 
-- en lugar de leer el libro completo página por página (Sequential Scan)

-- Creacion del indice para el tecnico de los reportes
\i docker-entrypoint-initdb.d/V1_20260323_create_index_tecnico_reportes.sql

-- Creacion de analize para reporte_fallos
\i docker-entrypoint-initdb.d/V1_20260323_create_analyze_reporte_fallos.sql

--VACUUM: Recupera el espacio físico en el disco al limpiar las "tuplas muertas"
--ANALYZE: Refresca los metadatos de la tabla para que el motor sepa exactamente cómo están distribuidos los datos

--5. Módulo 4: Documentación y Metadatos (Catálogo)
-- Agregar comentarios a tablas y columnas para mejorar la documentación interna de la base de datos
\i docker-entrypoint-initdb.d/V1_20260323_create_comments.sql
