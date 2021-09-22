require_relative 'database_connection'

class Booking

  attr_reader :start_date, :end_date, :user_id, :listing_id, :confirmed, :booking_id

  def initialize(start_date:, end_date:, user_id:, listing_id:, confirmed:, booking_id:)
    @start_date = start_date
    @end_date = end_date
    @user_id = user_id
    @listing_id = listing_id
    @confirmed = confirmed
    @booking_id = booking_id
  end

  def self.create(start_date:, end_date:, user_id:, listing_id:)
    result = DatabaseConnection.query("INSERT INTO bookings (start_date, end_date, user_id, listing_id)
                                       VALUES ('#{start_date}', '#{end_date}', '#{user_id}', '#{listing_id}')
                                       RETURNING booking_id;")
    Booking.new(start_date: start_date, 
                end_date: end_date, 
                user_id: user_id,
                listing_id: listing_id,
                confirmed: false,
                booking_id: result[0]['booking_id'])
  end

end
