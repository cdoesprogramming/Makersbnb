require 'pg'

def makersbnb_test_database
  p 'Setting up the database...'

  connection = PG.connect(dbname: 'makersbnb_test_database')

  connection.exec("TRUNCATE listings;")
end