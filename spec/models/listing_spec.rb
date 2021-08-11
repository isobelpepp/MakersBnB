require_relative '../../app/lib/listing.rb'
require_relative '../helpers/persisted_data_listing.rb'
require_relative '../helpers/new_user_helper.rb'

describe Listing do

  describe '.all' do
    it 'gets all of the listings in the db' do
      Listing.create(name: 'Izzys Igloo', description: 'Cold and icy', price: 10, user_id: new_user.user_id)
      Listing.create(name: 'Callums Cave', description: 'Dark', price: 100, user_id: new_user.user_id)
      listings = Listing.all

      expect(listings.length).to eq 2
      expect(listings.first).to be_a Listing
      expect(listings.first.name).to eq 'Izzys Igloo'
      expect(listings.first.description).to eq 'Cold and icy'
      expect(listings.first.price).to eq '10'
      expect(listings.last.name).to eq 'Callums Cave'
    end
  end

  describe '.create' do
    it 'creates a new listing' do
      listing = Listing.create(name: 'Izzys Igloo', description: 'Cold and icy', price: 10, user_id: new_user.user_id)
      persisted_data = persisted_data_listing(table: 'listings', listing_id: listing.listing_id)
      expect(listing).to be_a Listing
      expect(listing.name).to eq 'Izzys Igloo'
      expect(listing.description).to eq 'Cold and icy'
      expect(listing.price).to eq 10
      expect(listing.listing_id).to eq persisted_data[0]['listing_id']
    end
  end
  
end