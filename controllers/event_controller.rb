require_relative('../models/event')

#INDEX
#get all events for sport sports/:id/events
get '/events' do
  @events = Event.all()
  erb(:'events/index')
end

#NEW
#get new form to add event /events/new
get '/events/new' do
  @sports = Sport.all()
  erb(:'events/new')
end

#CREATE
#post new event onto list /events
post '/events' do
  @event = Event.new(params)
  @event.save()
  erb(:'events/create')
end

#SHOW
#get single event by unique ID /events/:id
get '/events/:id' do
  @event = Event.find(params[:id])
  erb(:'events/show')
end

#EDIT
#get new form to update event /events/:id/edit
get '/events/:id/edit' do
  @event = Event.find(params[:id])
  @sports = Sport.all()
  erb(:'events/edit')
end

#UPDATE
#put update event details /events/:id
put '/events/:id' do
  Event.update(params)
  redirect to("/events/#{params[:id]}")
end

#DESTROY
#delete event using unqiue id, redirect to /events