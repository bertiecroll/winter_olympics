# Winter Olympics

## Description:

A RESTful web application which allows the user to record and track data for 2018 Winter Olympics.  
Project created while studying at CodeClan, Edinburgh.  

## Usage:

* User can create nations, athletes and both individual and team Olympic events.  
* Results for each event can be submitted and application will track winners and medal count for each nation.  
* All data is persisted on SQL database.

## Installing and Running App

### Requirements
* Ruby with Sinatra and PG Gems.
* PostgreSQL - install instructions [here](https://www.postgresql.org/docs/9.6/static/tutorial-install.html)

1. Clone repository using `git clone https://github.com/bertiecroll/winter_olympics.git'
2. create psql database using `psql` then `create database winter_olympics'
3. create databse tables using `psql -d winter_olympics -f db/winter_olympics.sql` from root project folder
4. add seed data using `ruby db/seed.rb` from root project folder
5. start server using `ruby app.rb` from root project folder
6. application with run on localhost:4567

## Built With

Ruby.  
Sinatra.  
SQL (Posgres).
HTML.
CSS. 
