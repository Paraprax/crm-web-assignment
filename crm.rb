require_relative 'contact'
require 'sinatra'

#Contact.create('Lois', 'Lane', 'll@dailyplanet.com', 'Reporter')
#Contact.create('Clark', 'Kent', 'ck@dailyplanet.com', 'Reporter')
#Contact.create('Jimmy', 'Olsen', 'supermanspal@dailyplanet.com', 'Photographer')
#Contact.create('Perry', 'White', 'chief@dailyplanet.com', 'Editor-In-Chief')
#Contact.create('Lex', 'Luthor', 'lex@lexcorp.com', 'C.E.O.')
#Contact.create('Gus', 'Gorman', 'gus@webscoe.com', 'Programmer')

get '/' do
  @crm_app_name = "METROLODEX"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
 erb :new_contact
end

post '/contacts' do
  contact = Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note],
  )
  redirect to('/')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :display_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.update(first_name: params[:first_name])
    @contact.update(last_name: params[:last_name])
    @contact.update(email: params[:email])
    @contact.update(note: params[:note])
    redirect to('/')
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/delete' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to ('/')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to ('/')
  else
    raise Sinatra::NotFound
  end
end


get '/about' do
  erb :about
end
