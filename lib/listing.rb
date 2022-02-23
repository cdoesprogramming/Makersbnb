require 'pg'

class Listing

  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name = name
    @description = descritption
    @price = price
  end

  def self.create(name:, description:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test_database')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec("INSERT INTO listings (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING name, description, price")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test_database')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM listings")
    rseult.map do |listing|
      Listing.new(id: listing['id'], name: listing['name'], description: listing['description'], price: listing['price'])
    end
end