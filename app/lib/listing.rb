require_relative 'database_connection'

class Listing

  attr_reader :listing_id, :name, :description, :price, :user_id

  def initialize(listing_id:, name:, description:, price:, user_id:)
    @listing_id = listing_id
    @name = name
    @description = description
    @price = price
    @user_id = user_id
  end

  def self.create(name:, description:, price:, user_id:)
    result = DatabaseConnection.query("INSERT INTO listings (name, description, price, user_id)
                                       VALUES ('#{name}', '#{description}', '#{price}', 
                                       #{user_id}) RETURNING listing_id;")
    Listing.new(
      listing_id: result[0]['listing_id'],
      name: name,
      description: description,
      price: price,
      user_id: user_id
    )
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM listings;")
    result.map do |listing| 
      Listing.new(
      listing_id: listing['listing_id'],
      name: listing['name'],
      description: listing['description'],
      price: listing['price'],
      user_id: listing['user_id']
      )
    end
  end
end
