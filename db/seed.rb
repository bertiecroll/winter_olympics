require('pry-byebug')
require_relative('../models/nation')
require_relative('../models/sport')

Nation.delete_all()
Sport.delete_all()

@uk = Nation.new('name' => "United Kingdom", 'region' => "Europe")
@uk.save()
@france = Nation.new('name' => "France", 'region' => "Europe")
@france.save()

@sport_1 = Sport.new('name' => "Alpine Skiing", 'score_method' => "time")
@sport_1.save()
@sport_2 = Sport.new('name' => "Figure Skating", 'score_method' => "points")
@sport_2.save()
@sport_3 = Sport.new('name' => "Skeleton", 'score_method' => "time")
@sport_3.save()


binding.pry
nil