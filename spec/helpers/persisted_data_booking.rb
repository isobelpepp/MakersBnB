require 'pg'

def persisted_data_booking(table:, booking_id:)
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.query("SELECT * FROM #{table} WHERE booking_id = '#{booking_id}';")
end
