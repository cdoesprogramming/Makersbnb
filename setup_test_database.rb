# in spec/setup_test_database.rb

require 'pg'

def setup_test_database

  p "Setting up test database..."

  connection = PG.connect(dbname: 'makersbnb_manager_test')

  # Clear the user table

  connection.exec("TRUNCATE user;")

end
