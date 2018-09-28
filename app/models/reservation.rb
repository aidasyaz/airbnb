class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	# validates :reservations, presence: true, numericality: { only_integer: true, :greater_than_or_equal_to 1 }
	validates :start_date, presence: true
	validates :end_date, presence: true

	# validate that start date is before end date and not before current date reserving
	validate :check_dates
	validate :check_dates_today
	before_create :compute_total_price, :compute_total_days_booked

	def compute_total_price
		listing_price = Listing.find(self.listing_id).price_rates
		self.total_price = (self.end_date - self.start_date) * listing_price
	end

	def compute_total_days_booked
		self.total_days = (self.end_date - self.start_date)
	end

	# validated but no error msg displayed
	def check_dates
		if self.start_date > self.end_date 
			errors.add(:date_error, "Start date must be before end date")
			# p Reservation.errors.messages
		end
	end

	# # validated but no error msg displayed
	def check_dates_today
		if self.start_date <= Date.today
			errors.add(:date_error, "start date cannot be before today")
		end
	end

	# validate there is no overlap dates chosen -> (27th oct n 27th oct )
	# validate there is no overlap with other reservations for the list to book 
	def overlaps?(other)
		# find reservations based on list id
		listing_with_reservations = Listing.find(self.listing_id).Reservation
		self.start_date <= other.end_date && other.start_date <= self.end_date
	end


	# validate that guest number input = at least max guest number on list
	
	# def guest_number
	# 	self.guest <= @listing.self.guest 
	# end



	
end
