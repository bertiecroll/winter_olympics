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
# #get new form to update result /results/:id/edit
# get '/contests/:contest_id/results/:id/edit' do
#   @contest = Contest.find(params[:contest_id])
#   @nations = Nation.all()
#   @result = Result.find(params[:id])
#   erb(:'results/edit')
# end

# #UPDATE
# #put update result details /results/:id
# put '/results/:id' do
#   Result.update(params)
#   Nation.update_medals
#   redirect to("/contests/#{params[:contest_id]}")
# end

# #DESTROY
# #delete result using unqiue id, /results/:id
# delete '/results/:id' do
#   @result = Result.find(params[:id])
#   @result.delete()
#   redirect to("/contests/#{@result.contest_id}")
# end