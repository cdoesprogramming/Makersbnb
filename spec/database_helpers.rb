require 'pg'

def persisted_data(id:)
  connection = PG.connect(dbname: 'makersbnb_manager_test')
  connection.query("SELECT * FROM bnbuser WHERE id = '#{id}';")
end
