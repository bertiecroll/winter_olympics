require_relative('../models/contest')

#INDEX
#get all contests /contests
get '/contests' do
  @contests = Contest.all()
  erb(:'/contests/index')
end

#NEW
#get new form to add contest /contests/new
get '/contests/new' do
  @sports = Sport.all()
  @venues = Venue.all()
  erb(:'/contests/new')
end

#CREATE
#post new contest onto list /contests

#SHOW
#get single contest by unique ID /contests/:id

#EDIT
#get new form to update contest /contests/:id/edit

#UPDATE
#put update contest details /contests/:id

#DESTROY
#delete contest using unqiue id, redirect to /contests