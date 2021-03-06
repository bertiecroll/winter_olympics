DROP TABLE IF EXISTS results;
DROP TABLE IF EXISTS team_results;
DROP TABLE IF EXISTS contests;
DROP TABLE IF EXISTS athletes_teams;
DROP TABLE IF EXISTS teams; 
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS venues;
DROP TABLE IF EXISTS athletes;
DROP TABLE IF EXISTS sports; 
DROP TABLE IF EXISTS nations;

CREATE TABLE nations (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  region VARCHAR(255),
  gold INT4,
  silver INT4,
  bronze INT4
);

CREATE TABLE sports (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE athletes (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  date_of_birth TIMESTAMP,
  gender VARCHAR(255),
  image VARCHAR(255),
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
  team_size INT2,
  sport_id INT4 REFERENCES sports(id) ON DELETE CASCADE
);

CREATE TABLE teams (
  id SERIAL4 PRIMARY KEY,
  event_id INT4 REFERENCES events(id) ON DELETE CASCADE,
  nation_id INT4 REFERENCES nations(id) ON DELETE CASCADE
);

CREATE TABLE athletes_teams (
  id SERIAL4 PRIMARY KEY,
  athlete_id INT4 REFERENCES athletes(id) ON DELETE CASCADE,
  team_id INT4 REFERENCES teams(id) ON DELETE CASCADE
);

CREATE TABLE contests (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  date_time TIMESTAMP,
  event_id INT4 REFERENCES events(id) ON DELETE CASCADE,
  venue_id INT4 REFERENCES venues(id) ON DELETE CASCADE
);

CREATE TABLE team_results (
  id SERIAL4 PRIMARY KEY,
  score VARCHAR(255),
  team_id INT4 REFERENCES teams(id) ON DELETE CASCADE,
  contest_id INT4 REFERENCES contests(id) ON DELETE CASCADE
);

CREATE TABLE results (
  id SERIAL4 PRIMARY KEY,
  score VARCHAR(255),
  athlete_id INT4 REFERENCES athletes(id) ON DELETE CASCADE,
  contest_id INT4 REFERENCES contests(id) ON DELETE CASCADE
);
