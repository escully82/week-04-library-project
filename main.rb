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
#  @libraries = Library.all
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

 ## +      Books      + ##

 # + The main Books page will provide links to:
 # + - homepage (index)
 # + - patron page
 # + - library page
 # + - staff member page

 # + It will also have a form (requiring input) listing:
 # + - title
 # + - author
 # + - isbn

 #+-----+#

 # New

 get '/books/new' do
   @book = Book.new
   erb :books_new
 end

 # Create

 post '/books' do
   @book = Book.new(params)

   if @book.save
     redirect to('/books')
   else
     erb :books_new
   end
 end

 # Index

 get "/books" do
   @books = Book.all
   erb :books_index
 end

 # Show

 get '/books/:id' do
   @book = Book.find_by_id(params['id']) # nil or Library object
   erb :books_show
 end

 # Edit

 get '/books/:id/edit' do
    @book = Book.find_by_id(params['id'])
    erb :books_edit
 end

 post '/books/:id' do
    @book = Book.find_by_id(params['id'])

    if @book.update_attributes(title: params['title'],
                                 author: params['author'],
                                 isbn: params['isbn'])
      redirect to("/books/#{@book.id}")
    else
      erb :books_edit
    end
  end

  ## +      Patrons      + ##

  # + The main Books page will provide links to:
  # + - homepage (index)
  # + - patron page
  # + - library page
  # + - staff member page

  # + It will also have a form (requiring input) listing:
  # + - name
  # + - email address

  #+-----+#

  # Index

  get "/patrons" do
    @patrons = Patron.all
    erb :patrons_index
  end

  # New

  get '/patrons/new' do
    @patron = Patron.new
    erb :patrons_new
  end

  # Create

  post '/patrons' do
    # create library object
    @patron = Patron.new(params)

    if @patron.save
      redirect to('/patrons')
    else
      erb :patrons_new
    end
  end

  # Show

  get '/patrons/:id' do
    @patrons = Patron.all
    @patron = Patron.find_by_id(params['id']) # nil or Library object
    erb :patrons_show
  end

  # Edit

  get '/patrons/:id/edit' do
     @patron = Patron.find_by_id(params['id'])

     erb :patrons_edit
   end

   post '/patrons/:id' do
     @patron = Patron.find_by_id(params['id'])

     if @patron.update_attributes(name: params['name'],
                                  email: params['email'])
       redirect to("/patrons/#{@patron.id}")
     else
       erb :patrons_edit
     end
   end

   ## +      Staff Members      + ##

   # + The main Books page will provide links to:
   # + - homepage (index)
   # + - patron page
   # + - library page
   # + - staff member page

   # + It will also have a form (requiring input) listing:
   # + - name
   # + - email address

   #+-----+#

   # Index

   get "/staff_members" do
     @staff_members = StaffMember.all
     erb :staff_members_index
   end

   # New

   get '/staff_members/new' do
     @staff_member = StaffMember.new
     erb :staff_members_new
   end

   # Create

   post '/staff_members' do
     # create library object
     @staff_member = StaffMember.new(params)

     if @staff_member.save
       redirect to('/staff_members')
     else
       erb :staff_members_new
     end
   end

   # Show

   get '/staff_members/:id' do
     @staff_members = StaffMember.all
     @staff_member = StaffMember.find_by_id(params['id']) # nil or Library object
     erb :staff_members_show
   end

   # Edit

   get '/staff_members/:id/edit' do
      @staff_member = StaffMember.find_by_id(params['id'])

      erb :staff_members_edit
    end

    post '/staff_members/:id' do
      @staff_member = StaffMember.find_by_id(params['id'])

      if @staff_member.update_attributes(name: params['name'],
                                         email: params['email'])
        redirect to("/staff_members/#{@staff_member.id}")
      else
        erb :staff_members_edit
      end
    end


binding.pry
