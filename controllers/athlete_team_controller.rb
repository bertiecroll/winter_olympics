require_relative('../models/athlete_team')

#NEW
#get new form to add athlete to team /teams/:id/athletes/new
get '/teams/:id/athletes/new' do
  @team = Team.find(params[:id])
  @athletes = Athlete.all()
  erb(:'athletes_teams/new')
end

#CREATE
#post new athlete onto list /teams/:id/athletes
post '/athletes_teams' do
  @athlete_team = AthleteTeam.new(params)
  @athlete_team.save()
  erb(:'athletes_teams/create')
end

#SHOW
#get single athlete by unique ID /athletes/:id

#EDIT
#get new form to update athlete /athletes/:id/edit

#UPDATE
#put update athlete details /athletes/:id

#DESTROY
#delete athlete using unqiue id, redirect to /athletes
delete '/athletes_teams/:id' do
  @athlete_team = AthleteTeam.find(params[:id])
  @athlete_team.delete()
  redirect to("/teams/#{@athlete_team.team_id}")
end