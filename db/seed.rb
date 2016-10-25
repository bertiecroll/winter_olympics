require('pry-byebug')
require_relative('../models/nation')
require_relative('../models/sport')
require_relative('../models/event')
require_relative('../models/venue')
require_relative('../models/contest')
require_relative('../models/athlete')
require_relative('../models/result')
require_relative('../models/team')
require_relative('../models/athlete_team')
require_relative('../models/team_result')

Result.delete_all()
TeamResult.delete_all()
Athlete.delete_all()
Contest.delete_all()
Event.delete_all()
Venue.delete_all()
Nation.delete_all()
Sport.delete_all()

#SPORTS
@sport_1 = Sport.new('name' => "Alpine Skiing")
@sport_1.save()
@sport_2 = Sport.new('name' => "Figure Skating")
@sport_2.save()
@sport_3 = Sport.new('name' => "Skeleton")
@sport_3.save()
@sport_4 = Sport.new('name' => "Short Track Speed Skating")
@sport_4.save()
@sport_5 = Sport.new('name' => "Ski Jumping")
@sport_5.save()
@sport_6 = Sport.new('name' => "Snowboard")
@sport_6.save()
@sport_7 = Sport.new('name' => "Luge")
@sport_7.save()

#NATIONS
@nation_1 = Nation.new('name' => "United Kingdom", 'region' => "Europe", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_1.save()
@nation_2  = Nation.new('name' => "France", 'region' => "Europe", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_2 .save()
@nation_3  = Nation.new('name' => "Austria", 'region' => "Europe", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_3 .save()
@nation_4  = Nation.new('name' => "United States of America", 'region' => "North America", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_4 .save()
@nation_5  = Nation.new('name' => "China", 'region' => "Asia", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_5 .save()
@nation_6  = Nation.new('name' => "Korea South", 'region' => "Asia", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_6 .save()
@nation_7  = Nation.new('name' => "Canada", 'region' => "North America", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_7 .save()
@nation_8  = Nation.new('name' => "Sweden", 'region' => "Europe", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_8 .save()
@nation_9  = Nation.new('name' => "Italy", 'region' => "Europe", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_9 .save()
@nation_10  = Nation.new('name' => "Japan", 'region' => "Asia", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_10.save()
@nation_11  = Nation.new('name' => "Argentina", 'region' => "South America", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_11.save()
@nation_12  = Nation.new('name' => "Brazil", 'region' => "South America", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_12.save()
@nation_13  = Nation.new('name' => "Germany", 'region' => "Europe", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_13.save()
@nation_14  = Nation.new('name' => "Iceland", 'region' => "Europe", 'gold' => 0, 'silver' => 0, 'bronze' => 0)
@nation_14.save()

#EVENTS
@event_1 = Event.new('name' => "Slalom", 'class' => "male", 'score_method' => "time", 'team_size' => 1, 'sport_id' => @sport_1.id)
@event_1.save()
@event_2 = Event.new('name' => "Downhill", 'class' => "female", 'score_method' => "time", 'team_size' => 1, 'sport_id' => @sport_1.id)
@event_2.save()
@event_3 = Event.new('name' => "Individual", 'class' => "male", 'score_method' => "points", 'team_size' => 1, 'sport_id' => @sport_2.id)
@event_3.save()
@event_4 = Event.new('name' => "Individual", 'class' => "female", 'score_method' => "points", 'team_size' => 1, 'sport_id' => @sport_2.id)
@event_4.save()
@event_5 = Event.new('name' => "Individual", 'class' => "male", 'score_method' => "time", 'team_size' => 1, 'sport_id' => @sport_3.id)
@event_5.save()
@event_6 = Event.new('name' => "Individual", 'class' => "female", 'score_method' => "time", 'team_size' => 1, 'sport_id' => @sport_3.id)
@event_6.save()
@event_7 = Event.new('name' => "1500M", 'class' => "male", 'score_method' => "time", 'team_size' => 1, 'sport_id' => @sport_4.id)
@event_7.save()
@event_8 = Event.new('name' => "500M", 'class' => "male", 'score_method' => "time", 'team_size' => 1, 'sport_id' => @sport_4.id)
@event_8.save()
@event_9 = Event.new('name' => "Normal Hill Individual", 'class' => "female", 'score_method' => "points", 'team_size' => 1, 'sport_id' => @sport_5.id)
@event_9.save()
@event_10 = Event.new('name' => "Large Hill Individual", 'class' => "male", 'score_method' => "points", 'team_size' => 1, 'sport_id' => @sport_5.id)
@event_10.save()
@event_11 = Event.new('name' => "Half-Pipe", 'class' => "female", 'score_method' => "points", 'team_size' => 1, 'sport_id' => @sport_6.id)
@event_11.save()
@event_12 = Event.new('name' => "Slope-Style", 'class' => "female", 'score_method' => "points", 'team_size' => 1, 'sport_id' => @sport_6.id)
@event_12.save()
@event_13 = Event.new('name' => "Singles", 'class' => "male", 'score_method' => "time", 'team_size' => 1, 'sport_id' => @sport_7.id)
@event_13.save()
@event_14 = Event.new('name' => "Singles", 'class' => "female", 'score_method' => "time", 'team_size' => 1, 'sport_id' => @sport_7.id)
@event_14.save()
@event_15 = Event.new('name' => "5000M Relay", 'class' => "male", 'score_method' => "time", 'team_size' => 3, 'sport_id' => @sport_4.id)
@event_15.save()

#VENUES
@venue_1 = Venue.new('name' => "Yongpyong Alpine Centre", 'location' => "Pyeongchang", 'capacity' => 10000)
@venue_1.save()
@venue_2 = Venue.new('name' => "Alpensia Sliding Centre", 'location' => "Pyeongchang", 'capacity' => 7000)
@venue_2.save()
@venue_3 = Venue.new('name' => "Gangneung Ice Arena", 'location' => "Gangneung", 'capacity' => 12000)
@venue_3.save()
@venue_4 = Venue.new('name' => "Alpensia Ski Jumping Center", 'location' => "Pyeongchang", 'capacity' => 2500)
@venue_4.save()
@venue_5 = Venue.new('name' => "Bokwang Snow Park", 'location' => "Pyeongchang", 'capacity' => 5000)
@venue_5.save()
@venue_6 = Venue.new('name' => "Gangneung Oval", 'location' => "Gangneung", 'capacity' => 8000)
@venue_6.save()
@venue_7 = Venue.new('name' => "Jeongseon Alpine Centre", 'location' => "Pyeongchang", 'capacity' => 6000)
@venue_7.save()

#CONTEST
@contest_1 = Contest.new('name' => "qualifying", 'event_id' => @event_1.id, 'venue_id' => @venue_1.id)
@contest_1.save()
@contest_2 = Contest.new('name' => "Final", 'event_id' => @event_1.id, 'venue_id' => @venue_1.id)
@contest_2.save()
@contest_3 = Contest.new('name' => "Final", 'event_id' => @event_3.id, 'venue_id' => @venue_3.id)
@contest_3.save()
@contest_4 = Contest.new('name' => "Final", 'event_id' => @event_2.id, 'venue_id' => @venue_7.id)
@contest_4.save()
@contest_5 = Contest.new('name' => "Final", 'event_id' => @event_4.id, 'venue_id' => @venue_3.id)
@contest_5.save()
@contest_6 = Contest.new('name' => "Final", 'event_id' => @event_5.id, 'venue_id' => @venue_2.id)
@contest_6.save()
@contest_7 = Contest.new('name' => "Final", 'event_id' => @event_6.id, 'venue_id' => @venue_2.id)
@contest_7.save()
@contest_8 = Contest.new('name' => "Final", 'event_id' => @event_7.id, 'venue_id' => @venue_6.id)
@contest_8.save()
@contest_9 = Contest.new('name' => "Final", 'event_id' => @event_8.id, 'venue_id' => @venue_6.id)
@contest_9.save()
@contest_10 = Contest.new('name' => "Final", 'event_id' => @event_9.id, 'venue_id' => @venue_4.id)
@contest_10.save()
@contest_11 = Contest.new('name' => "Final", 'event_id' => @event_10.id, 'venue_id' => @venue_4.id)
@contest_11.save()
@contest_12 = Contest.new('name' => "Final", 'event_id' => @event_11.id, 'venue_id' => @venue_5.id)
@contest_12.save()
@contest_13 = Contest.new('name' => "Final", 'event_id' => @event_12.id, 'venue_id' => @venue_5.id)
@contest_13.save()
@contest_14 = Contest.new('name' => "Final", 'event_id' => @event_13.id, 'venue_id' => @venue_2.id)
@contest_14.save()
@contest_15 = Contest.new('name' => "Final", 'event_id' => @event_14.id, 'venue_id' => @venue_2.id)
@contest_15.save()
@contest_16 = Contest.new('name' => "Final", 'event_id' => @event_15.id, 'venue_id' => @venue_6.id)
@contest_16.save()

#TEAM
@team_1 = Team.new('event_id' => @event_15.id, 'nation_id' => @nation_1.id)
@team_1.save()
@team_2 = Team.new('event_id' => @event_15.id, 'nation_id' => @nation_2.id)
@team_2.save()
@team_3 = Team.new('event_id' => @event_15.id, 'nation_id' => @nation_3.id)
@team_3.save()
@team_4 = Team.new('event_id' => @event_15.id, 'nation_id' => @nation_4.id)
@team_4.save()


#ATHLETE
@athlete_1 = Athlete.new('first_name' => "David", 'last_name' => "Haye", 'date_of_birth' => "1986-12-05", 'gender' => "male", 'nation_id' => @nation_1.id)
@athlete_1.save()
@athlete_2 = Athlete.new('first_name' => "Paul", 'last_name' => "Pogba", 'date_of_birth' => "1993-03-15", 'gender' => "male", 'nation_id' => @nation_2.id)
@athlete_2.save()
@athlete_3 = Athlete.new('first_name' => "Mario", 'last_name' => "Matt", 'date_of_birth' => "1979-04-09", 'gender' => "male", 'nation_id' => @nation_3.id)
@athlete_3.save()
@athlete_4 = Athlete.new('first_name' => "Bertie", 'last_name' => "Croll", 'date_of_birth' => "1987-08-21", 'gender' => "male", 'nation_id' => @nation_1.id)
@athlete_4.save()
@athlete_5 = Athlete.new('first_name' => "Wolfgang", 'last_name' => "Mozart", 'date_of_birth' => "1956-01-27", 'gender' => "male", 'nation_id' => @nation_3.id)
@athlete_5.save()
@athlete_6 = Athlete.new('first_name' => "Tom", 'last_name' => "Hanks", 'date_of_birth' => "1956-07-09", 'gender' => "male", 'nation_id' => @nation_4.id)
@athlete_6.save()
@athlete_7 = Athlete.new('first_name' => "Hillary", 'last_name' => "Clinton", 'date_of_birth' => "1947-10-26", 'gender' => "female", 'nation_id' => @nation_4.id)
@athlete_7.save()
@athlete_8 = Athlete.new('first_name' => "Jackie", 'last_name' => "Chan", 'date_of_birth' => "1956-04-07", 'gender' => "male", 'nation_id' => @nation_5.id)
@athlete_8.save()
@athlete_9 = Athlete.new('first_name' => "Li", 'last_name' => "Na", 'date_of_birth' => "1982-02-26", 'gender' => "female", 'nation_id' => @nation_5.id)
@athlete_9.save()
@athlete_10 = Athlete.new('first_name' => "Kim", 'last_name' => "Yuna", 'date_of_birth' => "1990-09-05", 'gender' => "female", 'nation_id' => @nation_6.id)
@athlete_10.save()
@athlete_11 = Athlete.new('first_name' => "Jae-sang", 'last_name' => "Park", 'date_of_birth' => "1977-12-31", 'gender' => "male", 'nation_id' => @nation_6.id)
@athlete_11.save()
@athlete_12 = Athlete.new('first_name' => "Justin", 'last_name' => "Bieber", 'date_of_birth' => "1994-03-01", 'gender' => "male", 'nation_id' => @nation_7.id)
@athlete_12.save()
@athlete_13 = Athlete.new('first_name' => "Rachel", 'last_name' => "McAdams", 'date_of_birth' => "1978-11-17", 'gender' => "female", 'nation_id' => @nation_7.id)
@athlete_13.save()
@athlete_14 = Athlete.new('first_name' => "Peter", 'last_name' => "Stormare", 'date_of_birth' => "1953-08-27", 'gender' => "male", 'nation_id' => @nation_8.id)
@athlete_14.save()
@athlete_15 = Athlete.new('first_name' => "Malin", 'last_name' => "Akerman", 'date_of_birth' => "1978-05-12", 'gender' => "female", 'nation_id' => @nation_8.id)
@athlete_15.save()
@athlete_16 = Athlete.new('first_name' => "Antonio", 'last_name' => "Conte", 'date_of_birth' => "1969-07-31", 'gender' => "male", 'nation_id' => @nation_9.id)
@athlete_16.save()
@athlete_17 = Athlete.new('first_name' => "Marisa", 'last_name' => "Tomei", 'date_of_birth' => "1964-12-04", 'gender' => "female", 'nation_id' => @nation_9.id)
@athlete_17.save()
@athlete_18 = Athlete.new('first_name' => "Keisuke", 'last_name' => "Honda", 'date_of_birth' => "1986-06-13", 'gender' => "male", 'nation_id' => @nation_10.id)
@athlete_18.save()
@athlete_19 = Athlete.new('first_name' => "Chiaki", 'last_name' => "Kuriyama", 'date_of_birth' => "1984-10-10", 'gender' => "female", 'nation_id' => @nation_10.id)
@athlete_19.save()
@athlete_20 = Athlete.new('first_name' => "Coco", 'last_name' => "Chanel", 'date_of_birth' => "1990-02-14", 'gender' => "female", 'nation_id' => @nation_2.id)
@athlete_20.save()
@athlete_21 = Athlete.new('first_name' => "Lionel", 'last_name' => "Messi", 'date_of_birth' => "1987-06-24", 'gender' => "male", 'nation_id' => @nation_11.id)
@athlete_21.save()
@athlete_22 = Athlete.new('first_name' => "Eva", 'last_name' => "Peron", 'date_of_birth' => "1985-07-07", 'gender' => "female", 'nation_id' => @nation_11.id)
@athlete_22.save()
@athlete_23 = Athlete.new('first_name' => "Anderson", 'last_name' => "Silva", 'date_of_birth' => "1975-04-14", 'gender' => "male", 'nation_id' => @nation_12.id)
@athlete_23.save()
@athlete_24 = Athlete.new('first_name' => "Gisele", 'last_name' => "Bundchen", 'date_of_birth' => "1980-07-20", 'gender' => "female", 'nation_id' => @nation_12.id)
@athlete_24.save()
@athlete_25 = Athlete.new('first_name' => "Heidi", 'last_name' => "Klum", 'date_of_birth' => "1973-06-01", 'gender' => "female", 'nation_id' => @nation_13.id)
@athlete_25.save()
@athlete_26 = Athlete.new('first_name' => "David", 'last_name' => "Hasselhoff", 'date_of_birth' => "1952-06-17", 'gender' => "male", 'nation_id' => @nation_13.id)
@athlete_26.save()
@athlete_27 = Athlete.new('first_name' => "Bjork", 'last_name' => "Gudmundsdottir", 'date_of_birth' => "1965-11-21", 'gender' => "female", 'nation_id' => @nation_14.id)
@athlete_27.save()
@athlete_28 = Athlete.new('first_name' => "Eidur", 'last_name' => "Gudjohnsen", 'date_of_birth' => "1978-09-15", 'gender' => "male", 'nation_id' => @nation_14.id)
@athlete_28.save()
@athlete_29 = Athlete.new('first_name' => "James", 'last_name' => "Bond", 'date_of_birth' => "1968-04-13", 'gender' => "male", 'nation_id' => @nation_1.id)
@athlete_29.save()
@athlete_30 = Athlete.new('first_name' => "Vincent", 'last_name' => "Cassel", 'date_of_birth' => "1966-11-23", 'gender' => "male", 'nation_id' => @nation_2.id)
@athlete_30.save()
@athlete_31 = Athlete.new('first_name' => "Arnold", 'last_name' => "Schwarzenegger", 'date_of_birth' => "1947-07-30", 'gender' => "male", 'nation_id' => @nation_3.id)
@athlete_31.save()
@athlete_32 = Athlete.new('first_name' => "Dwanye", 'last_name' => "Johnson", 'date_of_birth' => "1972-05-02", 'gender' => "male", 'nation_id' => @nation_4.id)
@athlete_32.save()
@athlete_33 = Athlete.new('first_name' => "Vincent", 'last_name' => "Kavinsky", 'date_of_birth' => "1992-06-24", 'gender' => "male", 'nation_id' => @nation_2.id)
@athlete_33.save()
@athlete_34 = Athlete.new('first_name' => "kanye", 'last_name' => "West", 'date_of_birth' => "1977-06-08", 'gender' => "male", 'nation_id' => @nation_4.id)
@athlete_34.save()

#ATHLETES_TEAMS
@athlete_team_1 = AthleteTeam.new('team_id' => @team_1.id, 'athlete_id' => @athlete_1.id)
@athlete_team_1.save()
@athlete_team_2 = AthleteTeam.new('team_id' => @team_1.id, 'athlete_id' => @athlete_4.id)
@athlete_team_2.save()
@athlete_team_3 = AthleteTeam.new('team_id' => @team_1.id, 'athlete_id' => @athlete_29.id)
@athlete_team_3.save()
@athlete_team_4 = AthleteTeam.new('team_id' => @team_2.id, 'athlete_id' => @athlete_2.id)
@athlete_team_4.save()
@athlete_team_5 = AthleteTeam.new('team_id' => @team_2.id, 'athlete_id' => @athlete_30.id)
@athlete_team_5.save()
@athlete_team_6 = AthleteTeam.new('team_id' => @team_2.id, 'athlete_id' => @athlete_33.id)
@athlete_team_6.save()
@athlete_team_7 = AthleteTeam.new('team_id' => @team_3.id, 'athlete_id' => @athlete_3.id)
@athlete_team_7.save()
@athlete_team_8 = AthleteTeam.new('team_id' => @team_3.id, 'athlete_id' => @athlete_5.id)
@athlete_team_8.save()
@athlete_team_9 = AthleteTeam.new('team_id' => @team_3.id, 'athlete_id' => @athlete_31.id)
@athlete_team_9.save()
@athlete_team_10 = AthleteTeam.new('team_id' => @team_4.id, 'athlete_id' => @athlete_6.id)
@athlete_team_10.save()
@athlete_team_11 = AthleteTeam.new('team_id' => @team_4.id, 'athlete_id' => @athlete_32.id)
@athlete_team_11.save()
@athlete_team_12 = AthleteTeam.new('team_id' => @team_4.id, 'athlete_id' => @athlete_34.id)
@athlete_team_12.save()

#RESULT
@result_1 = Result.new('score' => "0:1:41.850", 'athlete_id' => @athlete_1.id, 'contest_id' => @contest_2.id) #2-GB
@result_1.save()
@result_2 = Result.new('score' => "0:1:55.300", 'athlete_id' => @athlete_3.id, 'contest_id' => @contest_2.id)
@result_2.save()
@result_3 = Result.new('score' => "0:2:10.010", 'athlete_id' => @athlete_5.id, 'contest_id' => @contest_2.id)
@result_3.save()
@result_4 = Result.new('score' => "0:1:35.500", 'athlete_id' => @athlete_6.id, 'contest_id' => @contest_2.id) #1-USA
@result_4.save()
@result_5 = Result.new('score' => "0:1:48.000", 'athlete_id' => @athlete_8.id, 'contest_id' => @contest_2.id)  #3-CHINA
@result_5.save()
@result_6 = Result.new('score' => "210", 'athlete_id' => @athlete_10.id, 'contest_id' => @contest_5.id) #3-SOUTH KOREA
@result_6.save()
@result_7 = Result.new('score' => "212", 'athlete_id' => @athlete_13.id, 'contest_id' => @contest_5.id) #2-CANADA
@result_7.save()
@result_8 = Result.new('score' => "206", 'athlete_id' => @athlete_17.id, 'contest_id' => @contest_5.id)
@result_8.save()
@result_9 = Result.new('score' => "218", 'athlete_id' => @athlete_19.id, 'contest_id' => @contest_5.id) #1-JAPAN
@result_9.save()
@result_10 = Result.new('score' => "201", 'athlete_id' => @athlete_20.id, 'contest_id' => @contest_5.id)
@result_10.save()
@result_11 = Result.new('score' => "0:0:41.555", 'athlete_id' => @athlete_11.id, 'contest_id' => @contest_9.id) #1-SOUTH KOREA
@result_11.save()
@result_12 = Result.new('score' => "0:0:49.200", 'athlete_id' => @athlete_12.id, 'contest_id' => @contest_9.id)
@result_12.save()
@result_13 = Result.new('score' => "0:0:45.195", 'athlete_id' => @athlete_16.id, 'contest_id' => @contest_9.id) #3-ITALY
@result_13.save()
@result_14 = Result.new('score' => "0:0:50.234", 'athlete_id' => @athlete_18.id, 'contest_id' => @contest_9.id)
@result_14.save()
@result_15 = Result.new('score' => "0:0:43.960", 'athlete_id' => @athlete_14.id, 'contest_id' => @contest_9.id) #2-SWEDEN
@result_15.save()
@result_16 = Result.new('score' => "590", 'athlete_id' => @athlete_7.id, 'contest_id' => @contest_13.id)
@result_16.save()
@result_17 = Result.new('score' => "620", 'athlete_id' => @athlete_9.id, 'contest_id' => @contest_13.id) #1-CHINA
@result_17.save()
@result_18 = Result.new('score' => "550", 'athlete_id' => @athlete_10.id, 'contest_id' => @contest_13.id)
@result_18.save()
@result_19 = Result.new('score' => "615", 'athlete_id' => @athlete_13.id, 'contest_id' => @contest_13.id) #2-CANADA
@result_19.save()
@result_20 = Result.new('score' => "602", 'athlete_id' => @athlete_15.id, 'contest_id' => @contest_13.id) #3-SWEDEN
@result_20.save()

#TEAM RESULTS
@team_result_1 = TeamResult.new('score' => "0:3:55.500", 'team_id' => @team_1.id, 'contest_id' => @contest_16.id) #1-UK
@team_result_1.save()
@team_result_2 = TeamResult.new('score' => "0:4:15.230", 'team_id' => @team_2.id, 'contest_id' => @contest_16.id) #FRANCE
@team_result_2.save()
@team_result_3 = TeamResult.new('score' => "0:3:58.000", 'team_id' => @team_3.id, 'contest_id' => @contest_16.id) #2-AUSTRIA
@team_result_3.save()
@team_result_4 = TeamResult.new('score' => "0:4:12.911", 'team_id' => @team_4.id, 'contest_id' => @contest_16.id) #3-USA
@team_result_4.save()

Nation.update_medals()
# binding.pry
# nil