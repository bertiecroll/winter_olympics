require('pry-byebug')
require_relative('../models/nation')

Nation.delete_all()

@uk = Nation.new('name' => "United Kingdom", 'region' => "Europe")
@uk.save()
@france = Nation.new('name' => "France", 'region' => "Europe")
@france.save()

binding.pry
nil