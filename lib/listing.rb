require 'pg'


class Listing
  def self.create
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test_database')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec("INSERT INTO listings (name, photo, description, price) VALUES ('#{@name}', 'bytea('/public/images/yellow.jpg')', NULL, NULL);")
  end
end