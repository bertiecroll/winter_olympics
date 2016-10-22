require_relative('../models/venue')

#INDEX
#get all venues /venues
get '/venues' do
  @venues = Venue.all()
  erb(:'venues/index')
end

#NEW
#get new form to add venue /venues/new
get '/venues/new' do
  erb(:'venues/new')
end

#CREATE
#post new venue onto list /venues
post '/venues' do
  @venue = Venue.new(params)
  @venue.save()
  erb(:'venues/create')
end

#SHOW
#get single venue by unique ID /venues/:id
get '/venues/:id' do
  @venue = Venue.find(params[:id])
  erb(:'venues/show')
end

#EDIT
#get new form to update venue /venues/:id/edit
get '/venues/:id/edit' do
  @venue = Venue.find(params[:id])
  erb(:'venues/edit')
end

#UPDATE
#put update venue details /venues/:id
put '/venues/:id' do
  Venue.update(params)
  redirect to("/venues/#{params['id']}")
end

#DESTROY
#delete venue using unqiue id, redirect to /venues