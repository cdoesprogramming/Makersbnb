require 'pg'

class Listing
  def self.create
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test_database')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec("INSERT INTO listings (name, description, price) VALUES ('#{@name}', NULL, NULL);")
  end
end