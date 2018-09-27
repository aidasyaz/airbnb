class ReservationsController < ApplicationController
	
	# show 1 of the reservation
	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		# total_price
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id
		@reservation.listing_id = params[:listing_id]
		# date validations
		# check_dates.valid? && check_dates_today.valid?
		if @reservation.save
			flash[:success] = "Successfully Booked"
			redirect_to listing_reservation_path(params[:listing_id], @reservation.listing_id)
		else
			flash[:error] = "Property wasnt booked. Try again."
			# flash[:error] = Reservation.errors.messages
			redirect_back fallback_location: listing_path(params[:listing_id])
		end
	end

	# def edit
	# end

	# def update
	# end

	# def destroy
	# end

	private
	def reservation_params
		params.require(:reservation).permit(:start_date, :end_date, :guest)
	end
end
