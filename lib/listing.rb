require 'pg'
require_relative '../lib/listing'

class Listing

  attr_reader :id, :name, :description, :price

  def initialize(id:, name:, description:, price:)
    @id = id
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
    p "#{name}"
    result = connection.exec_params("INSERT INTO listings (name, description, price) VALUES($1, $2, $3) RETURNING id, name, description, price;", [name, description, price])

    #result = connection.exec_params("INSERT INTO listings (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING id, name, description, price;", [name, description, price])


    # result = connection.exec_params(

    #     "INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title]
    #  )
    list = Listing.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
    p list
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