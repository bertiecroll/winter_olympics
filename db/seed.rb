require('pry-byebug')
require_relative('../models/nation')

@uk = Nation.new('name' => "United Kingdom", 'region' => "Europe")
@uk.save()

binding.pry
nil