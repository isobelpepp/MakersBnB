require_relative 'new_user_helper'

def new_listing
  Listing.create(name: 'Izzys Igloo', description: 'Cold and icy', price: 10, user_id: new_user.user_id)
end