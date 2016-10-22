require_relative('../models/nation')

#INDEX
#get all nations /nations
get '/nations' do
  @nations = Nation.all()
  erb(:'nations/index')
end

#NEW
#get new form to add nation /nations/new
get '/nations/new' do
  erb(:'nations/new')
end

#CREATE
#post new nation onto list /nations
post '/nations' do
  @nation = Nation.new(params)
  @nation.save()
  erb(:'nations/create')
end

#SHOW
#get single nation by unique ID /nations/:id

#EDIT
#get new form to update nation /nations/:id/edit

#UPDATE
#put update nation details /nations/:id

#DESTROY
#delete nation using unqiue id, redirect to /nations