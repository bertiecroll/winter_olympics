require_relative('../models/athlete_team')

#NEW
#get new form to add athlete to team /athletes_teams/new
get '/teams/:id/athletes/new' do
  @team = Team.find(params[:id])
  @athletes = Athlete.all()
  erb(:'athletes_teams/new')
end

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