require('pry-byebug')
require_relative('../models/nation')
require_relative('../models/sport')

Nation.delete_all()

@uk = Nation.new('name' => "United Kingdom", 'region' => "Europe")
@uk.save()
@france = Nation.new('name' => "France", 'region' => "Europe")
@france.save()

@sport_1 = Sport.new('name' => "Alpine Skiing", 'score_method' => "time")
@sport_1.save()


binding.pry
nil