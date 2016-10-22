require_relative('../models/athlete')
require_relative('../models/nation')

#INDEX
#get all athletes /athletes
get '/athletes' do
  @athletes = Athlete.all()
  erb(:'athletes/index')
end

#NEW
#get new form to add athlete /athletes/new
get '/athletes/new' do
  @nations = Nation.all()
  erb(:'athletes/new')
end

#CREATE
#post new athlete onto list /athletes
post '/athletes' do
  @athlete = Athlete.new(params)
  @athlete.save()
  erb(:'athletes/create')
end

#SHOW
#get single athlete by unique ID /athletes/:id

#EDIT
#get new form to update athlete /athletes/:id/edit

#UPDATE
#put update athlete details /athletes/:id

#DESTROY
#delete athlete using unqiue id, redirect to /athletes