CREATE TABLE tecnicos(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	especialidad_id INT REFERENCES especialidades(id)
);