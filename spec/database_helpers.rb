require 'pg'
#require_relative '../lib/listing.rb'
require_relative '../lib/database_connection'

def persisted_data_listing(id:)
  connection = PG.connect(dbname: 'makersbnb_manager_test')
  connection.query("SELECT * FROM listings WHERE id = '#{id}';")
end

def persisted_data_user(id:)
  connection = PG.connect(dbname: 'makersbnb_manager_test')
  connection.query("SELECT * FROM bnbuser WHERE id = '#{id}';")
end
