require 'pg'

class Listing

  attr_reader :id, :name, :description, :price

  def initialize(id:, name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end

  def self.create(name:, description:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test_database')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO listings (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING name, description, price;")
    Listing.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test_database')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM listings")
    result.map do |listing|
      Listing.new(id: listing['id'], name: listing['name'], description: listing['description'], price: listing['price'])
    end
  end
end