class Listing < ApplicationRecord
	belongs_to :user
	validates :product_title, :location, :guests_number, :room_type, :amenities, :availability, :price_rates, presence: true
end