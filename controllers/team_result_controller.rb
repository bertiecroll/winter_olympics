require_relative('../models/team_result')

#INDEX
#get all athletes /athletes

#NEW
#get new form to add result /team_results/new
get '/contests/:id/team_results/new' do
  @contest = Contest.find(params[:id])
  @teams = Team.all()
  erb(:'team_results/new')
end

# #CREATE
# #post new result onto list /team_results
post '/team_results' do
  @team_result = TeamResult.new(params)
  @team_result.save()
  Nation.update_medals
  erb(:'team_results/create')
end

# #SHOW
# #get single result by unique ID /results/:id

# #EDIT
# #get new form to update result /team_results/:id/edit
get '/contests/:contest_id/team_results/:id/edit' do
  @contest = Contest.find(params[:contest_id])
  @teams = Team.all()
  @team_result = TeamResult.find(params[:id])
  erb(:'team_results/edit')
end

# #UPDATE
# #put update result details /team_results/:id
put '/team_results/:id' do
  TeamResult.update(params)
  Nation.update_medals
  redirect to("/contests/#{params[:contest_id]}")
end

# #DESTROY
# #delete result using unqiue id, /team_results/:id
delete '/team_results/:id' do
  @team_result = TeamResult.find(params[:id])
  @team_result.delete()
  Nation.update_medals
  redirect to("/contests/#{@team_result.contest_id}")
end