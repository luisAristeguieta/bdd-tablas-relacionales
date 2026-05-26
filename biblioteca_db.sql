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

INSERT INTO autores (id, nombre, pais)
VALUES
(1, 'Gabriel Garcia Marquez', 'Colombia'),
(2, 'Romulo Gallegos', 'Venezuela'),
(3, 'Paulo Coelho', 'Brasil'),
(4, 'Alicia Yanez Cossio', 'Ecuador');

INSERT INTO libro_autor (la_libro_codigo_fk, la_autor_id_fk, anio_publicacion)
VALUES
('LIB01', 1, 1967),
('LIB02', 1, 1985),
('LIB03', 1, 1981),
('LIB04', 2, 1929),
('LIB05', 2, 1935),
('LIB06', 2, 1925),
('LIB07', 3, 1988),
('LIB08', 3, 1990),
('LIB09', 3, 1998),
('LIB10', 4, 1973);

-- Parte 5 Consultas SQL: 
--Consulta #1:

select l.titulo, a.nombre, a.pais, la.anio_publicacion
from libro_autor la
inner join libros l
    on la.la_libro_codigo_fk = l.codigo
inner join autores a
    on la.la_autor_id_fk = a.id;


-- Consulta # 2:

select l.titulo,la.anio_publicacion
from libros l
inner join libro_autor la
    on l.codigo = la.la_libro_codigo_fk     -- condición de unión
where la.anio_publicacion > 2020;          -- filtros adicionales

--Consulta # 3: 

select a.nombre, a.pais from autores a where pais like '%Venezuela%';

--Consulta # 4: 

select l.titulo, la.anio_publicacion
from libros l
inner join libro_autor la
    on l.codigo = la.la_libro_codigo_fk      -- condición de unión
ORDER BY la.anio_publicacion desc;           -- filtros adicionales

-- Consulta #5: 

select a.nombre, count(*) as Cantidad_de_Libros
from autores a
inner join libro_autor la
    on a.id = la.la_autor_id_fk     -- condición de unión
group by a.nombre
ORDER BY Cantidad_de_Libros;




