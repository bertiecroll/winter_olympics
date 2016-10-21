require('pry-byebug')
require_relative('../models/nation')
require_relative('../models/sport')
require_relative('../models/event')
require_relative('../models/venue')
require_relative('../models/athlete')


Athlete.delete_all()
Event.delete_all()
Venue.delete_all()
Nation.delete_all()
Sport.delete_all()

#NATIONS
@gb = Nation.new('name' => "Great Britain", 'region' => "Europe")
@gb.save()
@france = Nation.new('name' => "France", 'region' => "Europe")
@france.save()
@austria = Nation.new('name' => "Austria", 'region' => "Europe")
@austria.save()

#SPORTS
@sport_1 = Sport.new('name' => "Alpine Skiing", 'score_method' => "time")
@sport_1.save()
@sport_2 = Sport.new('name' => "Figure Skating", 'score_method' => "points")
@sport_2.save()
@sport_3 = Sport.new('name' => "Skeleton", 'score_method' => "time")
@sport_3.save()

#EVENTS
@event_1 = Event.new('name' => "Slalom", 'gender' => "male", 'sport_id' => @sport_1.id)
@event_1.save()
@event_2 = Event.new('name' => "Downhill", 'gender' => "female", 'sport_id' => @sport_1.id)
@event_2.save()
@event_3 = Event.new('name' => "Individual", 'gender' => "male", 'sport_id' => @sport_2.id)
@event_3.save()

#VENUES
@venue_1 = Venue.new('name' => "Yongpyong Alpine Centre", 'location' => "Pyeongchang", 'capacity' => 10000)
@venue_1.save()
@venue_2 = Venue.new('name' => "Alpensia Sliding Centre", 'location' => "Pyeongchang", 'capacity' => 7000)
@venue_2.save()
@venue_3 = Venue.new('name' => "Gangneung Ice Arena", 'location' => "Gangneung", 'capacity' => 12000)
@venue_3.save()

#ATHLETE
@athlete_1 = Athlete.new('first_name' => "David", 'last_name' => "Ryding", 'date_of_birth' => "1986-12-05", 'gender' => "male", 'nation_id' => @gb.id)
@athlete_1.save()
@athlete_2 = Athlete.new('first_name' => "Julien", 'last_name' => "Lizeroux", 'date_of_birth' => "1979-09-05", 'gender' => "male", 'nation_id' => @france.id)
@athlete_2.save()
@athlete_3 = Athlete.new('first_name' => "Mario", 'last_name' => "Matt", 'date_of_birth' => "1979-04-09", 'gender' => "male", 'nation_id' => @austria.id)
@athlete_3.save()


binding.pry
nil