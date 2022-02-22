#require 'bcrypt'
require_relative './database_connection'
require 'pg'

class User

  attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.create(name:, email:, password:)
    result = DatabaseConnection.query(
           "INSERT INTO bnbuser (name, email, password) VALUES($1, $2, $3) RETURNING id, name, email, password", [name, email, password]
         )
    User.new(id: result[0]['id'], name: result[0]['name'],  email: result[0]['email'], password: result[0]['password'])
  end

   def self.find(email:, password:)
    #return nil unless id
    result = DatabaseConnection.query(
      "SELECT * FROM bnbuser WHERE email = $1 AND password = $2" , [email, password]
    )

    p result

    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      email: result[0]['email'],
      password: result[0]['password']
    )

  end

end
