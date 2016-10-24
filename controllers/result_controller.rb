require_relative('../models/result')
require('pry-byebug')

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
#post new result onto list /contests/:id/results
post '/results' do
  @result = Result.new(params)
  @result.save()
  erb(:'results/create')
end

#SHOW
#get single result by unique ID /results/:id

#EDIT
#get new form to update result /results/:id/edit
get '/contests/:contest_id/results/:id/edit' do
  @contest = Contest.find(params[:contest_id])
  @athletes = Athlete.all()
  @result = Result.find(params[:id])
  erb(:'results/edit')
end

#UPDATE
#put update result details /results/:id
put '/results/:id' do
  Result.update(params)
  redirect to("/contests/#{params[:contest_id]}")
end

#DESTROY
#delete result using unqiue id, /results/:id
delete '/results/:id' do
  @result = Result.find(params[:id])
  @result.delete()
  redirect to("/contests/#{@result.contest_id}")
end