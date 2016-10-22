require_relative('../models/sport')

#INDEX
#get all sports /sports
get '/sports' do
  @sports = Sport.all()
  erb(:'sports/index')
end

#NEW
#get new form to add sport /sport/new
get '/sports/new' do
  erb(:'sports/new')
end

#CREATE
#post new sport onto list /sports
post '/sports' do
  @sport = Sport.new(params)
  @sport.save()
  erb(:'sports/create')
end

#SHOW
#get single sport by unique ID /sports/:id

#EDIT
#get new form to update sport /sports/:id/edit

#UPDATE
#put update sport details /sport/:id

#DESTROY
#delete sport using unqiue id, redirect to /sport