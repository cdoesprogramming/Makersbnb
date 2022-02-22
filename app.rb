require 'sinatra/base'
#require 'sinatra/flash'
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
  #, :method_override

  get '/' do
    erb :'user/home'
  end

  post '/createuser' do
    session[:message] = params[:newemail]
    user = User.create(name: params[:newname], email: params[:newemail], password: params[:newpassword])
    redirect '/listings'
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
    p user
    if user == nil
      session[:message] = "USER NOT FOUND"
      else
        session[:message] = user.email
      end
      redirect '/listings'
  end  

  run! if app_file == $0
end
