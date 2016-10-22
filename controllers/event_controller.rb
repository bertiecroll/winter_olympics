require_relative('../models/event')

#INDEX
#get all events for sport sports/:id/events
get '/events' do
  @events = Event.all()
  erb(:'events/index')
end

#NEW
#get new form to add event /events/new

#CREATE
#post new event onto list /events

#SHOW
#get single event by unique ID /events/:id

#EDIT
#get new form to update event /events/:id/edit

#UPDATE
#put update event details /events/:id

#DESTROY
#delete event using unqiue id, redirect to /events