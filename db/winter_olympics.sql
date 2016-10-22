DROP TABLE IF EXISTS results; 
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
  name VARCHAR(255)
);

CREATE TABLE athletes (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  date_of_birth DATE,
  gender VARCHAR(255),
  nation_id INT4 REFERENCES nations(id) ON DELETE CASCADE
);

CREATE TABLE venues (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255),
  capacity INT4
);

CREATE TABLE events (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  class VARCHAR(255),
  score_method VARCHAR(255),
  sport_id INT4 REFERENCES sports(id) ON DELETE CASCADE
);

CREATE TABLE contests (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  event_id INT4 REFERENCES events(id) ON DELETE CASCADE,
  venue_id INT4 REFERENCES venues(id) ON DELETE CASCADE
);

CREATE TABLE results (
  id SERIAL4 PRIMARY KEY,
  score VARCHAR(255),
  athlete_id INT4 REFERENCES athletes(id) ON DELETE CASCADE,
  contest_id INT4 REFERENCES contests(id) ON DELETE CASCADE
);
