DROP TABLE IF EXISTS athletes_contests; 
DROP TABLE IF EXISTS contests; 
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS venues;
DROP TABLE IF EXISTS athletes;
DROP TABLE IF EXISTS sports; 
DROP TABLE IF EXISTS nations;

CREATE TABLE nations (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  region VARCHAR(255)
);

CREATE TABLE sports (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  score_method VARCHAR(255)
);

CREATE TABLE athletes (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  date_of_birth DATE,
  nation_id INT4 REFERENCES nations(id)
);

CREATE TABLE venues (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255),
  capacity INT2
);

CREATE TABLE events (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  sport_id INT4 REFERENCES sports(id)
);

CREATE TABLE contests (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  event_id INT4 REFERENCES events(id),
  venue_id INT4 REFERENCES venues(id)
);

CREATE TABLE athletes_contests (
  id SERIAL4 PRIMARY KEY,
  score NUMERIC(8,3),
  athlete_id INT4 REFERENCES athletes(id),
  contest_id INT4 REFERENCES contests(id)
);
