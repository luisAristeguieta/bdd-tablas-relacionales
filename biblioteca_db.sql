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


