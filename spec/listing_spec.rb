require './lib/listing.rb'
require 'pg'
require_relative './makersbnb_test_database'

describe Listing do
  describe '#create' do
    it 'allows user to post their listing' do
      connection = PG.connect(dbname: 'makersbnb_test_database')
      p connection.exec("INSERT INTO listings (name, photo, description, price) VALUES ('Woodland Cottage', LOAD_FILE('../public/images/woodland_cottage.jpg'), NULL, NULL);")

      listing = Listing.create

      expect(listing).to include 'Woodland Cottage'
      expect(listing).to include '../public/images/woodland_cottage.jpg'
    end
  end
end