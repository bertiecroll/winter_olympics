require('pry-byebug')
require_relative('../models/nation')
require_relative('../models/sport')
require_relative('../models/athlete')

Athlete.delete_all()
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

#ATHLETE
@athlete_1 = Athlete.new('first_name' => "David", 'last_name' => "Ryding", 'date_of_birth' => "1986-12-05", 'nation_id' => @gb.id)
@athlete_1.save()
@athlete_2 = Athlete.new('first_name' => "Julien", 'last_name' => "Lizeroux", 'date_of_birth' => "1979-09-05", 'nation_id' => @france.id)
@athlete_2.save()
@athlete_3 = Athlete.new('first_name' => "Mario", 'last_name' => "Matt", 'date_of_birth' => "1979-04-09", 'nation_id' => @austria.id)
@athlete_3.save()


binding.pry
nil