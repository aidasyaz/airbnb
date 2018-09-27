class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing

	validates :start_date, presence: true
	validates :end_date, presence: true

	# validate that start date is before end date and not before current date reserving
	# validates :check_dates
	before_create :compute_total_price, :compute_total_days_booked

	def compute_total_price
		listing_price = Listing.find(self.listing_id).price_rates
		self.total_price = (self.end_date - self.start_date) * listing_price
	end

	def compute_total_days_booked
		# includes end date
		self.total_days = ((self.end_date+1) - self.start_date)
	end

	# def check_dates
	# 	if self.start_date > self.end_date
	# 		errors.add(:date_error, "Start date must be before end date")
	# 	end

	# end

# 	def check_dates_today
# 		if self.start_date < date.today
# 			errors.add(:date_error "start date cannot be before today")
# 		end
# 	end
end
