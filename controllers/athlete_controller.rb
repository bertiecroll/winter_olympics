require_relative('../models/athlete')

#INDEX
#get all athletes /athletes
get '/athletes' do
  @nations = Nation.all()
  query = params[:filter]
  @athletes = Athlete.all(query)
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
get '/athletes/:id' do
  @athlete = Athlete.find(params[:id])
  erb(:'athletes/show')
end

#EDIT
#get new form to update athlete /athletes/:id/edit
get '/athletes/:id/edit' do
  @athlete = Athlete.find(params[:id])
  @nations = Nation.all()
  erb(:'athletes/edit')
end

#UPDATE
#put update athlete details /athletes/:id
put '/athletes/:id' do
  Athlete.update(params)
  redirect to("/athletes/#{params[:id]}")
end

#DESTROY
#delete athlete using unqiue id, redirect to /athletes
delete '/athletes/:id' do
  @athlete = Athlete.find(params[:id])
  @athlete.delete()
  redirect to('/athletes')
end