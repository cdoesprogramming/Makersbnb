require 'sinatra/base'
require 'sinatra/flash'
require "sinatra/reloader"
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
   # user = User.find(email: params[:newemail], password: params[:newpassword])
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

  get '/listings' do
    @user_email = session[:message]
    erb :'user/mocklistings'
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

  run! if app_file == $0
end
