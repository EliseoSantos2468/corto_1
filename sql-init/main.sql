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