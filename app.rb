require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/athlete_controller')
require_relative('./controllers/nation_controller')
require_relative('./controllers/sport_controller')
require_relative('./controllers/event_controller')
require_relative('./controllers/venue_controller')
require_relative('./controllers/contest_controller')
require_relative('./controllers/result_controller')
require_relative('./controllers/team_controller')
require_relative('./controllers/athlete_team_controller')
require_relative('./controllers/team_result_controller')

#Leaderboard page showing table of nations ordered by points
get '/' do
  @nations = Nation.all
  erb(:leaderboard)
end

#Medalist page showing medalists for each event
get '/medalists' do
  query = params[:search]
  @sports = Sport.all(query)
  erb(:medalists)
end




