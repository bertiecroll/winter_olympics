require_relative('../models/venue')

#INDEX
#get all venues /venues
get '/venues' do
  @venues = Venue.all()
  erb(:'venues/index')
end

#NEW
#get new form to add venue /venues/new

#CREATE
#post new venue onto list /venues

#SHOW
#get single venue by unique ID /venues/:id

#EDIT
#get new form to update venue /venues/:id/edit

#UPDATE
#put update venue details /venues/:id

#DESTROY
#delete venue using unqiue id, redirect to /venues