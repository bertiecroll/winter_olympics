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
get '/contests/:id/edit' do
  @sports = Sport.all()
  @venues = Venue.all()
  @contest = Contest.find(params[:id])
  erb(:'contests/edit')
end

#UPDATE
#put update contest details /contests/:id
put '/contests/:id' do
  Contest.update(params)
  redirect to("/contests/#{params[:id]}")
end

#DESTROY
#delete contest using unqiue id, /contests/:id
delete '/contests/:id' do
  @contest = Contest.find(params[:id])
  @contest.delete()
  redirect to("/contests")
end