require './lib/listing.rb'
require 'pg'
require_relative './makersbnb_test_database'
require './spec/database_helpers'

describe Listing do
  describe '#create' do
    it 'allows user to post their listing' do
      listing = Listing.create(name: "Woodland Cottage", description: "Idyllic cottage surrounded by nature", price: "£100pn")
       
      persisted_data = persisted_data(id: listing.id) 

      expect(listing).to be_a Listing 
      expect(listing.id).to eq persisted_data.first['id']
      expect(listing.name).to eq 'Woodland Cottage'
      expect(listing.description).to eq 'Idyllic cottage surrounded by nature'
      expect(listing.price).to eq '£100pn'  
    end
  end

  describe '#all' do
    it 'displays a list of spaces' do
      connection = PG.connect(dbname: 'makersbnb_test_database')

      listing = Listing.create(name: "Woodland Cottage", description: "Idyllic cottage surrounded by nature", price: "£100")

      listings = Listing.all

      expect(listings.first).to be_a Listing
      expect(listings.first.name).to eq 'Woodland Cottage'
      expect(listings.first.description).to eq 'Idyllic cottage surrounded by nature'
      expect(listings.first.price).to eq '£100'
    end
  end
end