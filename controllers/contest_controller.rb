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
post '/contests' do
  @contest = Contest.new(params)
  @contest.save()
  erb(:'contests/create')
end

#SHOW
#get single contest by unique ID /contests/:id
get '/contests/:id' do
  @contest = Contest.find(params[:id])
  erb(:'contests/show')
end

#EDIT
#get new form to update contest /contests/:id/edit

#UPDATE
#put update contest details /contests/:id

#DESTROY
#delete contest using unqiue id, redirect to /contests