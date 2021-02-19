-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  moons TEXT[]
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE orbits_around
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE planet_galaxy
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets,
  galaxy_id INTEGER REFERENCES galaxy
);

CREATE TABLE planet_orbits_around
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets,
  orbits_around_id INTEGER REFERENCES orbits_around
);

INSERT INTO planets
  (name, orbital_period_in_years, moons)
VALUES
  ('Earth', 1.00,  '{"The Moon"}'),
  ('Mars', 1.88,  '{"Phobos", "Deimos"}'),
  ('Venus', 0.62,  '{}'),
  ('Neptune', 164.8, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03,  '{}'),
  ('Gliese 876 b', 0.23, '{}');

INSERT INTO galaxy
   (name)
   VALUES
   ('Milky way'),
   ('Andromeda Galaxy'),
  ('Canis Major Dwarf Galaxy'),
  ('Cygnus A');

INSERT INTO orbits_around
   (name)
   VALUES
   ('The Sun'),
   ('Proxima Centauri'),
   ('Gliese 876');

INSERT INTO planet_galaxy
  (planet_id,galaxy_id)
VALUES 
 (1,1),
 (2,1),
 (3,1),
 (4,1),
 (5,1),
 (6,1);  

INSERT INTO planet_orbits_around
    (planet_id,orbits_around_id)
  VALUES
    (1,1),
    (2,1),
    (3,1),
    (4,1),
    (5,2),
    (6,3);