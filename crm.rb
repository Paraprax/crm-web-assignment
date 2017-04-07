require_relative 'contact'
require 'sinatra'

Contact.create('Lois', 'Lane', 'll@dailyplanet.com', 'Reporter')
Contact.create('Clark', 'Kent', 'ck@dailyplanet.com', 'Reporter')
Contact.create('Jimmy', 'Olsen', 'supermanspal@dailyplanet.com', 'Photographer')
Contact.create('Perry', 'White', 'chief@dailyplanet.com', 'Editor-In-Chief')
Contact.create('Lex', 'Luthor', 'lex@lexcorp.com', 'C.E.O.')
Contact.create('Gus', 'Gorman', 'gus@webscoe.com', 'Programmer')


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
   Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
   redirect to('/contacts')
end
