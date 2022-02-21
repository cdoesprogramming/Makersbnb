require 'sinatra/base'
require 'sinatra/reloader'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    # "Hello, world"
    erb :'signin/home'
  end

  post '/mocklist' do
    erb :'signin/signout'
  end  

  run! if app_file == $0
end
