require 'sinatra/base'
require 'sinatra/reloader'
require './lib/listing'

class Makersbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @listings = Listing.all
    erb :index
  end

  get '/listings' do
    erb :new_listing
  end

  post '/new_listings' do
    Listing.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/'
  end


  run! if app_file == $0
end