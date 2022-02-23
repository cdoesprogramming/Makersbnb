require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'makersbnb_test_database')
  result = connection.query("SELECT * FROM listings WHERE id = #{id};")
  result.first
end