require_relative('../models/result')

#INDEX
#get all results /results
get '/results' do
  @results = Result.all()
  erb(:'results/index')
end

#NEW
#get new form to add result /results/new
get '/contests/:id/results/new' do
  @contest = Contest.find(params[:id])
  @athletes = Athlete.all()
  erb(:'results/new')
end

#CREATE
#post new result onto list /results

#SHOW
#get single result by unique ID /results/:id

#EDIT
#get new form to update result /results/:id/edit

#UPDATE
#put update result details /results/:id

#DESTROY
#delete result using unqiue id, /results/:id