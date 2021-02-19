-- All of the teams in the league
-- All of the goals scored by every player for each game
-- All of the players in the league and their corresponding teams
-- All of the referees who have been part of each game
-- All of the matches played between teams
-- All of the start and end dates for season that a league has
-- The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).

-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;


CREATE TABLE teams 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT
);



CREATE TABLE players
(
   id SERIAL PRIMARY KEY,
   name TEXT NOT NULL,
   team_id INTEGER REFERENCES teams
);


CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE matches

(
  id SERIAL PRIMARY KEY,
  home_team_id INTEGER REFERENCES teams,
  away_team_id INTEGER REFERENCES teams,
  date DATE,
  season_id INTEGER REFERENCES season,
  referee_id INTEGER REFERENCES referees
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches
);


CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    match_id INTEGER REFERENCES matches

);






INSERT INTO teams
 (name,city)
 VALUES
  ('FC Barcelona','Barcelona'),
  ('Manchester United F.C','Manchester'),
  ('Real Madrid C.F','Madrid'),
  ('Liverpool FC','Liverpool');

INSERT INTO players
(name,team_id)
VALUES
('Eden Hazard',3),
('Lionel Messi',1),
('Mohammad Salah',4),
('Kevin De Bruyne',2);

INSERT INTO referees
(name)
VALUES
('Adam Levine'),
('Billie Eilish'),
('Halsey'),
('Post Malone');

INSERT INTO season
(start_date,end_date)
VALUES
('2002-01-09','2002-02-09'),
('2006-05-06','2006-06-06'),
('2010-05-02','2010-06-02');

INSERT INTO matches
(home_team_id,away_team_id,date,season_id,referee_id)
VALUES
(2,4,'2010-05-13',2,3),
(1,3,'2006-05-13',3,2),
(3,2,'2002-02-01',1,1);

INSERT INTO results
(team_id,match_id)
VALUES
(1,1),
(2,1),
(2,2);

INSERT INTO goals 
(player_id,match_id)
VALUES
(1,3),
(4,3),
(2,2);







