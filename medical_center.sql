


DROP DATABASE IF EXISTS  medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER,
  sex TEXT,
  home_address TEXT,
  phone_number INTEGER
  
);

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  department TEXT
  
);

CREATE TABLE patient_doctor
(
  id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
  doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT
    
);

CREATE TABLE patient_disease 
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
);

INSERT INTO patients
  (name, age)
VALUES
  ('Tim Cooke', 63),
  ('Timothy Fox', 70),
  ('Norman Scott', 30);

INSERT INTO doctors
  (name,department)
VALUES
  ('Simon Whitfield', 'Endocrinology'),
  ('Devika Khanna', 'Obsetrician'),
  ('Rinky Mathew', 'ENT'),
  ('William Cooper', 'Family Medicine'),
  ('John Abraham', 'Pediatrics');

INSERT INTO patient_doctor
  (patient_id,doctor_id)
VALUES
 (1,1),
 (1,2),
 (2,4),
 (3,4),
 (3,5);

INSERT INTO diseases
  (name)
VALUES
  ('Ulceritis'),
  ('Diabetes'),
  ('Hypertension'),
  ('Hypothyroidism');

INSERT INTO patient_disease
    (patient_id,disease_id)
VALUES
    (1,2),
    (1,3),
    (1,4),
    (2,2),
    (2,3),
    (3,1);