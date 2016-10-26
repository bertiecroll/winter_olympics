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
  @athlete_count = Athlete.count()
  @nation_count = Nation.count()
  @sport_count = Sport.count()
  @event_count = Event.count()
  @venue_count = Venue.count()
  Nation.update_medals
  @nations = Nation.all
  erb(:leaderboard)
end

#Medalist page showing medalists for each event
get '/medalists' do
  @sports_filter = Sport.all()
  query = params[:filter]
  @sports = Sport.all(query)
  erb(:medalists)
end

#Schedule page showing contests and venues
get '/schedule' do
  @contests = Contest.all()
  @dates = Contest.dates()
  erb(:schedule)
end




