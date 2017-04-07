# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

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
