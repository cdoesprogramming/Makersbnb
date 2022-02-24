# require_relative './database_connection'
# require 'pg'

# class Listingdate

#     def self.all
#         if ENV['ENVIRONMENT'] == 'test'
#           connection = PG.connect(dbname: 'makersbnb_manager_test')
#         else
#           connection = PG.connect(dbname: 'makersbnb_manager')
#         end
    
#         result = connection.exec("SELECT * FROM listingdate WHERE listing_id = 2;")
#         count = 0
#         result.map do |listing|
#           Listingdate.new(id: listing['id'], listng_id: listing['listing_id'], date_available: listing['date_available'])
#         end
#       end



# end