require './lib/listing.rb'
require 'pg'
require_relative './makersbnb_test_database'

describe Listing do
  describe '#create' do
    it 'allows user to post their listing' do
      connection = PG.connect(dbname: 'makersbnb_test_database')
      p connection.exec("INSERT INTO listings (name, description, price) VALUES ('Woodland Cottage', NULL, NULL);")

      listing = Listing.create

      expect(listing).to include 'Woodland Cottage' # This isnt working, we are getting +#<PG::Result:0x0000000140688558 status=PGRES_COMMAND_OK ntuples=0 nfields=0 cmd_tuples=1>
    end
  end
end