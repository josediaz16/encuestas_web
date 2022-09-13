DROP DATABASE IF EXISTS encuestas_web;
CREATE DATABASE encuestas_web;

\c encuestas_web;

CREATE TABLE paises (
  id serial PRIMARY KEY,
  nombre VARCHAR ( 255 ) UNIQUE NOT NULL
);

CREATE TABLE encuestas (
  id serial PRIMARY KEY,
  nombre VARCHAR ( 255 ) NOT NULL,
  sexo VARCHAR ( 1 ) NOT NULL,
  edad INT NOT NULL,
  id_pais INT NOT NULL,
  FOREIGN KEY (id_pais) REFERENCES paises (id)
);

INSERT INTO paises(nombre)
VALUES('Colombia');
INSERT INTO paises(nombre)
VALUES('Argentina');
INSERT INTO paises(nombre)
VALUES('Mexico');
