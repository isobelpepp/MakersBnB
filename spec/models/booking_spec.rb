require_relative '../../app/lib/booking.rb'
require_relative '../helpers/persisted_data_booking.rb'
require_relative '../helpers/new_user_helper.rb'
require_relative '../helpers/new_listing_helper.rb'

describe Booking do
  describe '.create' do
    it 'creates a new booking' do
      user = new_user
      listing = new_listing
      booking = Booking.create(start_date: '01/02/2021', end_date: '10/02/2021',
                               user_id: user.user_id, listing_id: listing.listing_id)
      persisted_data = persisted_data_booking(table: 'bookings', booking_id: booking.booking_id)
      expect(booking).to be_a Booking
      expect(booking.start_date).to eq('01/02/2021')
      expect(booking.end_date).to eq('10/02/2021')
      expect(booking.user_id).to eq user.user_id
      expect(booking.listing_id).to eq listing.listing_id
      expect(booking.booking_id).to eq persisted_data[0]['booking_id']
    end
  end
end
