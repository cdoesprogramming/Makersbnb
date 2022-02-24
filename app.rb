require 'sinatra/base'
require 'sinatra/reloader'
require './lib/listing'
require 'sinatra/flash'
require 'pg'
require 'uri'
require './lib/user'
require './database_connection_setup'


class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :'user/home'
  end

   post '/createuser' do
   user = User.findemail(email: params[:newemail])
    if user == nil
      session[:message] = params[:newemail]
      user = User.create(name: params[:newname], email: params[:newemail], password: params[:newpassword])
      redirect '/listings'
    else
      flash[:notice] = 'Email already exists'
      redirect '/'
    end
  end

  get '/signin' do
    erb :'user/signin'
  end  

  get '/finduser' do
    user = User.find(email: params[:email], password: params[:password])
    if user == nil
     flash[:notice] = 'Email does not exist or incorrect password given'
     redirect '/signin'
    else
      session[:message] = user.email
      redirect '/listings'
    end
  end 
  
  get '/signout' do
    session[:message] = nil
    redirect '/'
  end

  get '/listings' do
    @listings = Listing.all
    p @listings
    erb :index
  end
  
  get '/new-listings' do
    erb :new_listing
  end

  post '/new-listings' do
    Listing.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/listings'
  end


  run! if app_file == $0
end
