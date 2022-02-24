require 'pg'
require_relative '../lib/listing.rb'

def persisted_data(id:)
  connection = PG.connect(dbname: 'makersbnb_test_database')
  connection.query("SELECT * FROM listings WHERE id = '#{id}';")
end
