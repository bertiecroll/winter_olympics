require_relative('../models/athlete')

#INDEX
#get all athletes /athletes
get '/athletes' do
  @athletes = Athlete.all()
  erb(:'athletes/index')
end

#NEW
#get new form to add athlete /athletes/new

#CREATE
#post new athlete onto list /athletes

#SHOW
#get single athlete by unique ID /athletes/:id

#EDIT
#get new form to update athlete /athletes/:id/edit

#UPDATE
#put update athlete details /athletes/:id

#DESTROY
#delete athlete using unqiue id, redirect to /athletes