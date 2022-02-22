require 'sinatra/base'
require 'sinatra/reloader'
require './lib/listing'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/listings' do
    erb :new_listing
  end

  post '/listings' do
    @name = params[:name]
    @image = params[:image]
    @listing = Listing.create
    redirect '/'
  end

  run! if app_file == $0
end