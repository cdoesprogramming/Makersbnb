require 'sinatra/base'
require 'sinatra/reloader'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :'signin/home'
  end

  post '/listings' do

    erb :'signin/mocklistings'
  end  

  run! if app_file == $0
end
