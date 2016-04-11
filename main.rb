require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"

## +    HomePage      + ##

# + The landing page, which have links to the other pages:
# + - Library page
# + - Book page
# + - Staff Member page
# + - Patron page
# + Maya also add links to actual libraries, just for s&g

# This is the homepage (root of all things) #

get "/" do
  erb :index
end

##+++++++++++++++++++++++++++++++++++++++++++##

## +      Library      + ##

# + The main Library page will provide links to:
# + - homepage (index)
# + - patron page
# + - book page
# + - staff member page

# + It will also have a form (requiring input) listing:
# + - name
# + - address
# + - phone number

#+-----+#



                     ##
                     ##
 ##   ######    #######   #####   ##      ##
###  ##    ##  ##    ##  ##   ##    ##  ##
 ##  ##    ##  ##    ##  ######       ##
 ##  ##    ##  ##    ##  ##         ##  ##
###  ##    ##   ######    #####   ##      ##

# Index

get "/libraries" do
  @libraries = Library.all
  erb :libraries_index
end

# New

get '/libraries/new' do
  @library = Library.new
  erb :libraries_new
end

# Create

post '/libraries' do
  # create library object
  @library = Library.new(params)

  if @library.save
    redirect to('/libraries')
  else
    erb :libraries_new
  end
end

# Show

get '/libraries/:id' do
  @libraries = Library.all
  @library = Library.find_by_id(params['id']) # nil or Library object
  erb :libraries_show
end

# Edit

get '/libraries/:id/edit' do
   @library = Library.find_by_id(params['id'])

   erb :libraries_edit
 end

 post '/libraries/:id' do
   @library = Library.find_by_id(params['id'])

   if @library.update_attributes(branch_name: params['branch_name'],
                                address: params['address'],
                                phone_number: params['phone_number'])
     redirect to("/libraries/#{@library.id}")
   else
     erb :libraries_edit
   end
 end

binding.pry
