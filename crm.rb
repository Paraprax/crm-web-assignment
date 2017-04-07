require_relative 'contact'
require 'sinatra'

#I feel like keeping these contacts
Contact.create('Orson', 'Welles', 'kane@citizen.com', 'CEO')
Contact.create('Tyrone', 'Power', 'cap@shazam.com', 'Co-Founder')
Contact.create('Christopher', 'Reeve', 'supes@wb.com', 'Believer')

get '/' do
  @crm_app_name = "Parker's CRM"
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
