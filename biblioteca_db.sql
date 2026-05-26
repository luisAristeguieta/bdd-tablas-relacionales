CREATE DATABASE biblioteca_db;

--Parte # 2 Creacion de tablas: (libros y autores)

CREATE TABLE libros (
    codigo VARCHAR(5) PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    paginas INT NOT NULL
);
	
CREATE TABLE autores (
	id INT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	pais VARCHAR(30) NOT NULL
);

--Verifica existencia: 
SELECT * FROM libros;
SELECT * FROM autores;

-- Parte # 3 Tabla rompimiento con PK compuestas y FK:

CREATE TABLE libro_autor (
	la_libro_codigo_fk VARCHAR(5) NOT NULL,
	la_autor_id_fk INT NOT NULL,
	anio_publicacion INT NOT NULL,

	CONSTRAINT pk_libro_autor PRIMARY KEY (la_libro_codigo_fk, la_autor_id_fk),
		
	CONSTRAINT fk_libro_autor_libro FOREIGN KEY (la_libro_codigo_fk) REFERENCES libros(codigo),
	CONSTRAINT fk_autor_libro_autor FOREIGN KEY (la_autor_id_fk) REFERENCES autores(id)
	
);

SELECT * FROM libro_autor;

-- Parte #4 Insertar datos: 

INSERT INTO libros (codigo, titulo, paginas)
VALUES
('LIB01', 'Cien Anos de Soledad', 471),
('LIB02', 'El Amor en los Tiempos del Colera', 348),
('LIB03', 'Cronica de una Muerte Anunciada', 122),
('LIB04', 'Dona Barbara', 428),
('LIB05', 'Canaima', 320),
('LIB06', 'La Trepadora', 290),
('LIB07', 'El Alquimista', 208),
('LIB08', 'Brida', 288),
('LIB09', 'Veronika Decide Morir', 240),
('LIB10', 'Bruna Soroche y los Tios', 310);







