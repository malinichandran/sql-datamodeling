


DROP DATABASE IF EXISTS  craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE region
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT
    
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  username_id INTEGER REFERENCES users,
  location POINT,
  region_id INTEGER REFERENCES region,
  category_id INTEGER REFERENCES categories
);


INSERT INTO region
  (name)
VALUES
  ('San Francisco Bay Area'),
  ('East Bay'),
  ('North Bay'),
  ('Los Angeles Area');

INSERT INTO categories
  (name)
VALUES
  ('Antiques'),
  ('Furniture'),
  ('Boats'),
  ('Books');

INSERT INTO users
(name)
VALUES
('Bradley Cooper'),
('Will Smith'),
('Kevin Hart');

INSERT INTO posts
  (title, username_id,location,region_id,category_id)
VALUES
 ('Vintage Old Oil Painting', 1, '-122.0574,37.4192',4, 1),
 ('The Comet Man Book',1, '-100.5678, 56.4356', 2, 4),
 ('Textbooks for sale',3, '-89.5678,78.4221', 4, 4),
 ('Free 3 Seat Recliner Sofa',2, '-90.6476,56.7847',1,2),
 ('Squamish Kayak',3, '-78.6788, 90.8788',3,3);

