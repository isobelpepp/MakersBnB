require 'pg'

def persisted_data_listing(table:, listing_id:)
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.query("SELECT * FROM #{table} WHERE listing_id = '#{listing_id}';")
end
