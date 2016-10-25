require_relative('../models/team')

#INDEX
#get all teams /teams
get '/teams' do
  @teams = Team.all()
  erb(:'teams/index')
end

#NEW
#get new form to add team /teams/new
get '/teams/new' do
  @nations = Nation.all()
  @sports = Sport.all()
  erb(:'teams/new')
end

#CREATE
#post new team onto list /teams

#SHOW
#get single team by unique ID /team/:id

#EDIT
#get new form to update team /teams/:id/edit

#UPDATE
#put update team details /teams/:id

#DESTROY
#delete team using unqiue id, redirect to /teams