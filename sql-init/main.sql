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
\i docker-entrypoint-initdb.d/V120260323_create_table_reporte_fallos.sql

-- 2.2. Integridad Referencial

--relacion entre pizarra y reporte respetando la regla de propagacion al eliminar
\i docker-entrypoint-initdb.d/V1_20260323_create_reference_pizarra_reporte.sql

--relacion entre tecnico y reporte respetando la regla de anulacion al eliminar
\i docker-entrypoint-initdb.d/V1_20260323_create_reference_tecnico_reporte.sql

-- 2.3 Automatización mediante Triggers y PL/pgSQL
\i docker-entrypoint-initdb.d/V1_20260323_create_trigger_cambio_estado.sql

-- Módulo 2: Modificación y Evolución del Esquema

--3.1. Alteración de Tablas (ALTER TABLE)
-- Creacion del check de limite del nivel de prioridad
\i docker-entrypoint-initdb.d/V1_20260323_create_constraint_ck_limite.sql


