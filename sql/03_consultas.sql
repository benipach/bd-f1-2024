USE f1_2024;

-- 1

-- Nombre, apellido y país de nacimiento de cada piloto, ordenados por país

/* Une cada piloto con su ciudad de nacimiento y esa ciudad con su país, porque el país no está guardado
en la tabla pilotos sino en paises (por la 3FN). Sirve para ver de qué países salen los pilotos de la parrilla.
Ojo que es el país donde nació, no su nacionalidad deportiva: Verstappen corre como neerlandés pero nació en Bélgica,
y Albon corre como tailandés pero nació en Londres. */

SELECT pilotos.nombre, pilotos.apellido, paises.nombre AS pais
FROM pilotos
JOIN ciudades ON pilotos.ciudad_id = ciudades.ciudad_id
JOIN paises ON ciudades.pais_id = paises.pais_id
ORDER BY paises.nombre, pilotos.apellido;

-- +-----------+------------+----------------+
-- | nombre    | apellido   | pais           |
-- +-----------+------------+----------------+
-- | Nico      | Hülkenberg | Alemania       |
-- | Franco    | Colapinto  | Argentina      |
-- | Jack      | Doohan     | Australia      |
-- | Oscar     | Piastri    | Australia      |
-- | Daniel    | Ricciardo  | Australia      |
-- | Max       | Verstappen | Bélgica        |
-- | Lance     | Stroll     | Canadá         |
-- | Guanyu    | Zhou       | China          |
-- | Kevin     | Magnussen  | Dinamarca      |
-- | Fernando  | Alonso     | España         |
-- | Carlos    | Sainz      | España         |
-- | Logan     | Sargeant   | Estados Unidos |
-- | Valtteri  | Bottas     | Finlandia      |
-- | Pierre    | Gasly      | Francia        |
-- | Esteban   | Ocon       | Francia        |
-- | Yuki      | Tsunoda    | Japón          |
-- | Sergio    | Pérez      | México         |
-- | Charles   | Leclerc    | Mónaco         |
-- | Liam      | Lawson     | Nueva Zelanda  |
-- | Alexander | Albon      | Reino Unido    |
-- | Oliver    | Bearman    | Reino Unido    |
-- | Lewis     | Hamilton   | Reino Unido    |
-- | Lando     | Norris     | Reino Unido    |
-- | George    | Russell    | Reino Unido    |
-- +-----------+------------+----------------+


-- 2

-- Nombre y ciudad sede de cada equipo

/* Muestra dónde tiene su base cada equipo. Se ve que la mayoría (6 de los 10) está en Reino Unido. */

SELECT equipos.nombre, ciudades.nombre AS ciudad
FROM equipos
JOIN ciudades ON equipos.ciudad_id = ciudades.ciudad_id
ORDER BY equipos.equipo_id;

-- +--------------+---------------+
-- | nombre       | ciudad        |
-- +--------------+---------------+
-- | McLaren      | Woking        |
-- | Ferrari      | Maranello     |
-- | Red Bull     | Milton Keynes |
-- | Mercedes-AMG | Brackley      |
-- | Aston Martin | Silverstone   |
-- | Alpine       | Enstone       |
-- | Haas         | Kannapolis    |
-- | RB           | Faenza        |
-- | Williams     | Grove         |
-- | Kick Sauber  | Hinwil        |
-- +--------------+---------------+


-- 3

-- Pilotos y el equipo en el que corrieron

/* Lista cada piloto con su equipo, agrupados por equipo. Algunos equipos tienen tres pilotos
porque hubo reemplazos durante la temporada (por ejemplo, Colapinto reemplazó a Sargeant en Williams). */

SELECT pilotos.nombre, pilotos.apellido, equipos.nombre AS equipo
FROM pilotos
JOIN equipos ON pilotos.equipo_id = equipos.equipo_id
ORDER BY equipos.equipo_id, pilotos.apellido;

-- +-----------+------------+--------------+
-- | nombre    | apellido   | equipo       |
-- +-----------+------------+--------------+
-- | Lando     | Norris     | McLaren      |
-- | Oscar     | Piastri    | McLaren      |
-- | Charles   | Leclerc    | Ferrari      |
-- | Carlos    | Sainz      | Ferrari      |
-- | Sergio    | Pérez      | Red Bull     |
-- | Max       | Verstappen | Red Bull     |
-- | Lewis     | Hamilton   | Mercedes-AMG |
-- | George    | Russell    | Mercedes-AMG |
-- | Fernando  | Alonso     | Aston Martin |
-- | Lance     | Stroll     | Aston Martin |
-- | Jack      | Doohan     | Alpine       |
-- | Pierre    | Gasly      | Alpine       |
-- | Esteban   | Ocon       | Alpine       |
-- | Oliver    | Bearman    | Haas         |
-- | Nico      | Hülkenberg | Haas         |
-- | Kevin     | Magnussen  | Haas         |
-- | Liam      | Lawson     | RB           |
-- | Daniel    | Ricciardo  | RB           |
-- | Yuki      | Tsunoda    | RB           |
-- | Alexander | Albon      | Williams     |
-- | Franco    | Colapinto  | Williams     |
-- | Logan     | Sargeant   | Williams     |
-- | Valtteri  | Bottas     | Kick Sauber  |
-- | Guanyu    | Zhou       | Kick Sauber  |
-- +-----------+------------+--------------+


-- 4

-- Nombre de cada circuito y la ciudad donde está

SELECT circuitos.nombre, ciudades.nombre AS ciudad
FROM circuitos
JOIN ciudades ON circuitos.ciudad_id = ciudades.ciudad_id
ORDER BY circuitos.circuito_id;

-- +------------------------------------+------------------+
-- | nombre                             | ciudad           |
-- +------------------------------------+------------------+
-- | Circuito Internacional de Bahréin  | Sakhir           |
-- | Circuito de Yeda                   | Yeda             |
-- | Circuito de Albert Park            | Melbourne        |
-- | Circuito de Suzuka                 | Suzuka           |
-- | Circuito Internacional de Shanghái | Shanghái         |
-- | Autódromo de Miami                 | Miami            |
-- | Autódromo Enzo e Dino Ferrari      | Imola            |
-- | Circuito de Mónaco                 | Montecarlo       |
-- | Circuito Gilles Villeneuve         | Montreal         |
-- | Circuito de Barcelona-Cataluña     | Montmeló         |
-- | Red Bull Ring                      | Spielberg        |
-- | Silverstone Circuit                | Silverstone      |
-- | Hungaroring                        | Mogyoród         |
-- | Circuit de Spa-Francorchamps       | Stavelot         |
-- | Circuito de Zandvoort              | Zandvoort        |
-- | Autodromo Nazionale di Monza       | Monza            |
-- | Circuito Callejero de Bakú         | Bakú             |
-- | Marina Bay Street Circuit          | Singapur         |
-- | Circuit of the Americas            | Austin           |
-- | Autódromo Hermanos Rodríguez       | Ciudad de México |
-- | Autódromo José Carlos Pace         | São Paulo        |
-- | Las Vegas Strip Circuit            | Las Vegas        |
-- | Circuito Internacional de Losail   | Lusail           |
-- | Yas Marina Circuit                 | Abu Dabi         |
-- +------------------------------------+------------------+


-- 5

-- Nombre de cada gran premio y su circuito, en orden de calendario

SELECT grandes_premios.nombre AS gran_premio, circuitos.nombre AS circuito
FROM grandes_premios
JOIN circuitos ON grandes_premios.circuito_id = circuitos.circuito_id
ORDER BY grandes_premios.fecha;

-- +---------------------------------+------------------------------------+
-- | gran_premio                     | circuito                           |
-- +---------------------------------+------------------------------------+
-- | Gran Premio de Bahréin          | Circuito Internacional de Bahréin  |
-- | Gran Premio de Arabia Saudita   | Circuito de Yeda                   |
-- | Gran Premio de Australia        | Circuito de Albert Park            |
-- | Gran Premio de Japón            | Circuito de Suzuka                 |
-- | Gran Premio de China            | Circuito Internacional de Shanghái |
-- | Gran Premio de Miami            | Autódromo de Miami                 |
-- | Gran Premio de Emilia-Romaña    | Autódromo Enzo e Dino Ferrari      |
-- | Gran Premio de Mónaco           | Circuito de Mónaco                 |
-- | Gran Premio de Canadá           | Circuito Gilles Villeneuve         |
-- | Gran Premio de España           | Circuito de Barcelona-Cataluña     |
-- | Gran Premio de Austria          | Red Bull Ring                      |
-- | Gran Premio de Gran Bretaña     | Silverstone Circuit                |
-- | Gran Premio de Hungría          | Hungaroring                        |
-- | Gran Premio de Bélgica          | Circuit de Spa-Francorchamps       |
-- | Gran Premio de los Países Bajos | Circuito de Zandvoort              |
-- | Gran Premio de Italia           | Autodromo Nazionale di Monza       |
-- | Gran Premio de Azerbaiyán       | Circuito Callejero de Bakú         |
-- | Gran Premio de Singapur         | Marina Bay Street Circuit          |
-- | Gran Premio de Estados Unidos   | Circuit of the Americas            |
-- | Gran Premio de México           | Autódromo Hermanos Rodríguez       |
-- | Gran Premio de São Paulo        | Autódromo José Carlos Pace         |
-- | Gran Premio de Las Vegas        | Las Vegas Strip Circuit            |
-- | Gran Premio de Qatar            | Circuito Internacional de Losail   |
-- | Gran Premio de Abu Dabi         | Yas Marina Circuit                 |
-- +---------------------------------+------------------------------------+


-- 6

-- Nombre y fecha de cada gran premio, con el apellido y número del piloto que lo ganó

/* Arma el calendario completo con los ganadores. Une tres tablas: el gran premio, su resultado
y el piloto ganador, que en resultados está guardado solo por su número. */

SELECT gp.nombre AS gran_premio, gp.fecha, p.apellido, p.numero
FROM grandes_premios gp
JOIN resultados r ON gp.gran_premio_id = r.gran_premio_id
JOIN pilotos p ON r.numero_piloto_ganador = p.numero
ORDER BY gp.fecha;

-- +---------------------------------+------------+------------+--------+
-- | gran_premio                     | fecha      | apellido   | numero |
-- +---------------------------------+------------+------------+--------+
-- | Gran Premio de Bahréin          | 2024-03-02 | Verstappen |      1 |
-- | Gran Premio de Arabia Saudita   | 2024-03-09 | Verstappen |      1 |
-- | Gran Premio de Australia        | 2024-03-24 | Sainz      |     55 |
-- | Gran Premio de Japón            | 2024-04-07 | Verstappen |      1 |
-- | Gran Premio de China            | 2024-04-21 | Verstappen |      1 |
-- | Gran Premio de Miami            | 2024-05-05 | Norris     |      4 |
-- | Gran Premio de Emilia-Romaña    | 2024-05-19 | Verstappen |      1 |
-- | Gran Premio de Mónaco           | 2024-05-26 | Leclerc    |     16 |
-- | Gran Premio de Canadá           | 2024-06-09 | Verstappen |      1 |
-- | Gran Premio de España           | 2024-06-23 | Verstappen |      1 |
-- | Gran Premio de Austria          | 2024-06-30 | Russell    |     63 |
-- | Gran Premio de Gran Bretaña     | 2024-07-07 | Hamilton   |     44 |
-- | Gran Premio de Hungría          | 2024-07-21 | Piastri    |     81 |
-- | Gran Premio de Bélgica          | 2024-07-28 | Hamilton   |     44 |
-- | Gran Premio de los Países Bajos | 2024-08-25 | Norris     |      4 |
-- | Gran Premio de Italia           | 2024-09-01 | Leclerc    |     16 |
-- | Gran Premio de Azerbaiyán       | 2024-09-15 | Piastri    |     81 |
-- | Gran Premio de Singapur         | 2024-09-22 | Norris     |      4 |
-- | Gran Premio de Estados Unidos   | 2024-10-20 | Leclerc    |     16 |
-- | Gran Premio de México           | 2024-10-27 | Sainz      |     55 |
-- | Gran Premio de São Paulo        | 2024-11-03 | Verstappen |      1 |
-- | Gran Premio de Las Vegas        | 2024-11-23 | Russell    |     63 |
-- | Gran Premio de Qatar            | 2024-12-01 | Verstappen |      1 |
-- | Gran Premio de Abu Dabi         | 2024-12-08 | Norris     |      4 |
-- +---------------------------------+------------+------------+--------+


-- 7

-- Número, nombre, apellido, posición y puntos de cada piloto en el campeonato de pilotos

SELECT pilotos.numero, pilotos.nombre, pilotos.apellido, campeonato_pilotos.posicion, campeonato_pilotos.puntos
FROM pilotos
JOIN campeonato_pilotos ON pilotos.numero = campeonato_pilotos.piloto_numero
ORDER BY campeonato_pilotos.posicion;

-- +--------+-----------+------------+----------+--------+
-- | numero | nombre    | apellido   | posicion | puntos |
-- +--------+-----------+------------+----------+--------+
-- |      1 | Max       | Verstappen |        1 |    437 |
-- |      4 | Lando     | Norris     |        2 |    374 |
-- |     16 | Charles   | Leclerc    |        3 |    356 |
-- |     81 | Oscar     | Piastri    |        4 |    292 |
-- |     55 | Carlos    | Sainz      |        5 |    290 |
-- |     63 | George    | Russell    |        6 |    245 |
-- |     44 | Lewis     | Hamilton   |        7 |    223 |
-- |     11 | Sergio    | Pérez      |        8 |    152 |
-- |     14 | Fernando  | Alonso     |        9 |     70 |
-- |     10 | Pierre    | Gasly      |       10 |     42 |
-- |     27 | Nico      | Hülkenberg |       11 |     41 |
-- |     22 | Yuki      | Tsunoda    |       12 |     30 |
-- |     18 | Lance     | Stroll     |       13 |     24 |
-- |     31 | Esteban   | Ocon       |       14 |     23 |
-- |     20 | Kevin     | Magnussen  |       15 |     16 |
-- |     23 | Alexander | Albon      |       16 |     12 |
-- |      3 | Daniel    | Ricciardo  |       17 |     12 |
-- |     50 | Oliver    | Bearman    |       18 |      7 |
-- |     43 | Franco    | Colapinto  |       19 |      5 |
-- |     24 | Guanyu    | Zhou       |       20 |      4 |
-- |     30 | Liam      | Lawson     |       21 |      4 |
-- |     77 | Valtteri  | Bottas     |       22 |      0 |
-- |      2 | Logan     | Sargeant   |       23 |      0 |
-- |     61 | Jack      | Doohan     |       24 |      0 |
-- +--------+-----------+------------+----------+--------+


-- 8

-- Nombre, posición y puntos de cada equipo en el campeonato de constructores

/* Se usa LEFT JOIN para que aparezcan todos los equipos, aunque alguno no tuviera un puesto cargado
en el campeonato (en ese caso, la posición y los puntos saldrían en NULL). */

SELECT equipos.nombre, campeonato_constructores.posicion, campeonato_constructores.puntos
FROM equipos
LEFT JOIN campeonato_constructores ON equipos.equipo_id = campeonato_constructores.equipo_id
ORDER BY campeonato_constructores.posicion;

-- +--------------+----------+--------+
-- | nombre       | posicion | puntos |
-- +--------------+----------+--------+
-- | McLaren      |        1 |    666 |
-- | Ferrari      |        2 |    652 |
-- | Red Bull     |        3 |    589 |
-- | Mercedes-AMG |        4 |    468 |
-- | Aston Martin |        5 |     94 |
-- | Alpine       |        6 |     65 |
-- | Haas         |        7 |     58 |
-- | RB           |        8 |     46 |
-- | Williams     |        9 |     17 |
-- | Kick Sauber  |       10 |      4 |
-- +--------------+----------+--------+


-- 9

-- Cantidad de grandes premios ganados por cada piloto, con su posición en el campeonato

/* Cuenta cuántas veces aparece cada piloto como ganador en resultados. Con LEFT JOIN también aparecen
los pilotos que no ganaron ninguna carrera, con 0. Muestra que Verstappen fue campeón ganando 9 de las 24 carreras,
y que hubo siete ganadores distintos en la temporada. */

SELECT pilotos.numero, pilotos.nombre, pilotos.apellido,
       COUNT(resultados.resultado_id) AS grandes_premios_ganados, campeonato_pilotos.posicion
FROM pilotos
LEFT JOIN resultados ON pilotos.numero = resultados.numero_piloto_ganador
LEFT JOIN campeonato_pilotos ON pilotos.numero = campeonato_pilotos.piloto_numero
GROUP BY pilotos.numero, pilotos.nombre, pilotos.apellido, campeonato_pilotos.posicion
ORDER BY grandes_premios_ganados DESC, campeonato_pilotos.posicion;

-- +--------+-----------+------------+-------------------------+----------+
-- | numero | nombre    | apellido   | grandes_premios_ganados | posicion |
-- +--------+-----------+------------+-------------------------+----------+
-- |      1 | Max       | Verstappen |                       9 |        1 |
-- |      4 | Lando     | Norris     |                       4 |        2 |
-- |     16 | Charles   | Leclerc    |                       3 |        3 |
-- |     81 | Oscar     | Piastri    |                       2 |        4 |
-- |     55 | Carlos    | Sainz      |                       2 |        5 |
-- |     63 | George    | Russell    |                       2 |        6 |
-- |     44 | Lewis     | Hamilton   |                       2 |        7 |
-- |     11 | Sergio    | Pérez      |                       0 |        8 |
-- |     14 | Fernando  | Alonso     |                       0 |        9 |
-- |     10 | Pierre    | Gasly      |                       0 |       10 |
-- |     27 | Nico      | Hülkenberg |                       0 |       11 |
-- |     22 | Yuki      | Tsunoda    |                       0 |       12 |
-- |     18 | Lance     | Stroll     |                       0 |       13 |
-- |     31 | Esteban   | Ocon       |                       0 |       14 |
-- |     20 | Kevin     | Magnussen  |                       0 |       15 |
-- |     23 | Alexander | Albon      |                       0 |       16 |
-- |      3 | Daniel    | Ricciardo  |                       0 |       17 |
-- |     50 | Oliver    | Bearman    |                       0 |       18 |
-- |     43 | Franco    | Colapinto  |                       0 |       19 |
-- |     24 | Guanyu    | Zhou       |                       0 |       20 |
-- |     30 | Liam      | Lawson     |                       0 |       21 |
-- |     77 | Valtteri  | Bottas     |                       0 |       22 |
-- |      2 | Logan     | Sargeant   |                       0 |       23 |
-- |     61 | Jack      | Doohan     |                       0 |       24 |
-- +--------+-----------+------------+-------------------------+----------+


-- 10

-- Cantidad de grandes premios ganados por cada equipo, con su ciudad sede y posición en el campeonato

/* Suma las victorias de los pilotos de cada equipo. Es interesante porque el equipo que más carreras ganó (Red Bull)
terminó tercero en constructores: McLaren fue campeón porque sus dos pilotos sumaron muchos puntos,
mientras que en Red Bull casi todos los puntos los hizo Verstappen. */

SELECT equipos.nombre AS equipo, ciudades.nombre AS ciudad_sede,
       COUNT(resultados.resultado_id) AS grandes_premios_ganados, campeonato_constructores.posicion
FROM equipos
JOIN pilotos ON equipos.equipo_id = pilotos.equipo_id
JOIN resultados ON pilotos.numero = resultados.numero_piloto_ganador
JOIN ciudades ON equipos.ciudad_id = ciudades.ciudad_id
JOIN campeonato_constructores ON equipos.equipo_id = campeonato_constructores.equipo_id
GROUP BY equipos.equipo_id, equipos.nombre, ciudades.nombre, campeonato_constructores.posicion
ORDER BY grandes_premios_ganados DESC;

-- +--------------+---------------+-------------------------+----------+
-- | equipo       | ciudad_sede   | grandes_premios_ganados | posicion |
-- +--------------+---------------+-------------------------+----------+
-- | Red Bull     | Milton Keynes |                       9 |        3 |
-- | McLaren      | Woking        |                       6 |        1 |
-- | Ferrari      | Maranello     |                       5 |        2 |
-- | Mercedes-AMG | Brackley      |                       4 |        4 |
-- +--------------+---------------+-------------------------+----------+


-- 11

-- Cantidad de grandes premios ganados según el país de nacimiento del piloto

/* Recorre cinco tablas: del gran premio al resultado, de ahí al piloto ganador, a su ciudad de nacimiento y a su país.
Como en la consulta 1, cuenta el país donde nació el piloto: por eso las 9 victorias de Verstappen
quedan en Bélgica y no en Países Bajos. */

SELECT pa.nombre AS pais, COUNT(gp.gran_premio_id) AS cantidad_gp_ganados
FROM grandes_premios gp
JOIN resultados r ON gp.gran_premio_id = r.gran_premio_id
JOIN pilotos p ON r.numero_piloto_ganador = p.numero
JOIN ciudades c ON p.ciudad_id = c.ciudad_id
JOIN paises pa ON c.pais_id = pa.pais_id
GROUP BY pa.nombre
ORDER BY cantidad_gp_ganados, pa.nombre;

-- +-------------+---------------------+
-- | pais        | cantidad_gp_ganados |
-- +-------------+---------------------+
-- | Australia   |                   2 |
-- | España      |                   2 |
-- | Mónaco      |                   3 |
-- | Reino Unido |                   8 |
-- | Bélgica     |                   9 |
-- +-------------+---------------------+
