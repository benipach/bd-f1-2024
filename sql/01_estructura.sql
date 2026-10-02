DROP DATABASE IF EXISTS f1_2024;
CREATE DATABASE f1_2024 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE f1_2024;

CREATE TABLE IF NOT EXISTS paises (

    pais_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL

);

-- Si se elimina un país, se eliminan sus ciudades para que no queden datos huérfanos.
CREATE TABLE IF NOT EXISTS ciudades (

    ciudad_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    anio_primer_gp INT,              -- NULL si nunca se corrió un gran premio en la ciudad
    pais_id INT NOT NULL,

    FOREIGN KEY (pais_id) REFERENCES paises(pais_id) ON DELETE CASCADE

);

-- Si se elimina la ciudad, el equipo sigue existiendo, pero sin sede asignada.
CREATE TABLE IF NOT EXISTS equipos (

    equipo_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    anio_fundacion INT NOT NULL,     -- año en que se fundó con su nombre actual
    cantidad_titulos INT NOT NULL,   -- campeonatos de constructores con su nombre actual, al final de 2024
    ciudad_id INT,

    FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id) ON DELETE SET NULL

);

-- Si se elimina el equipo, se eliminan sus pilotos: no tiene sentido un piloto sin equipo.
-- Si se elimina la ciudad de nacimiento, el piloto sigue existiendo, pero pierde esa relación.
CREATE TABLE IF NOT EXISTS pilotos (

    numero INT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    equipo_id INT NOT NULL,
    ciudad_id INT,

    FOREIGN KEY (equipo_id) REFERENCES equipos(equipo_id) ON DELETE CASCADE,
    FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id) ON DELETE SET NULL

);

-- Cada ciudad tiene un solo circuito (UNIQUE). Si se elimina la ciudad, el circuito queda sin ciudad.
CREATE TABLE IF NOT EXISTS circuitos (

    circuito_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    longitud_metros INT NOT NULL,
    ciudad_id INT UNIQUE,

    FOREIGN KEY (ciudad_id) REFERENCES ciudades(ciudad_id) ON DELETE SET NULL

);

-- Cada circuito tiene un solo gran premio en la temporada (UNIQUE).
-- Si se elimina el circuito, se eliminan sus grandes premios.
CREATE TABLE IF NOT EXISTS grandes_premios (

    gran_premio_id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    circuito_id INT NOT NULL UNIQUE,

    FOREIGN KEY (circuito_id) REFERENCES circuitos(circuito_id) ON DELETE CASCADE

);

-- Cada gran premio tiene un solo resultado (UNIQUE), con el ganador de la carrera.
-- Si se elimina el gran premio o el piloto ganador, se elimina el resultado.
CREATE TABLE IF NOT EXISTS resultados (

    resultado_id INT PRIMARY KEY,
    gran_premio_id INT NOT NULL UNIQUE,
    numero_piloto_ganador INT NOT NULL,
    tiempo TIME(3) NOT NULL,         -- hh:mm:ss.ms
    cantidad_vueltas INT NOT NULL,

    FOREIGN KEY (gran_premio_id) REFERENCES grandes_premios(gran_premio_id) ON DELETE CASCADE,
    FOREIGN KEY (numero_piloto_ganador) REFERENCES pilotos(numero) ON DELETE CASCADE

);

-- Posición final de cada piloto. Si se elimina el piloto, el puesto en el campeonato se mantiene
-- y piloto_numero queda en NULL.
CREATE TABLE IF NOT EXISTS campeonato_pilotos (

    campeonato_id INT PRIMARY KEY,
    piloto_numero INT UNIQUE,
    puntos INT NOT NULL,
    posicion INT NOT NULL UNIQUE,

    FOREIGN KEY (piloto_numero) REFERENCES pilotos(numero) ON DELETE SET NULL

);

-- Posición final de cada equipo. Igual que en el campeonato de pilotos, si se elimina el equipo,
-- el puesto se mantiene y equipo_id queda en NULL.
CREATE TABLE IF NOT EXISTS campeonato_constructores (

    campeonato_id INT PRIMARY KEY,
    equipo_id INT UNIQUE,
    puntos INT NOT NULL,
    posicion INT NOT NULL UNIQUE,

    FOREIGN KEY (equipo_id) REFERENCES equipos(equipo_id) ON DELETE SET NULL

);
