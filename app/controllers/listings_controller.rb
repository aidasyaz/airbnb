class ListingsController < ApplicationController

	
	def index
		@listing = Listing.paginate(:page => params[:page], :per_page => 10)
	end

	def new
		# authorization code for creating list

		if current_user.customer?
			flash[:notice] = "Sorry. You are not allowed to perform this action."
				return redirect_to listings_path, flash[:notice] = "Sorry. You do not have the permission to verify a property."
		else
			# if not customer then can create list
			@listing = Listing.new
		end
	end

	def create

		@listing = Listing.new(listing_params)
		@listing.user_id = current_user.id
		
			if @listing.save
				flash[:success] = "You have successfully created a new list!"
				redirect_to listings_path
			else 
				flash[:error] = "list was not saved!"
				render 'new'
			end
	end

	def show
		@listing = Listing.find(params[:id])
		@reservation = Reservation.new
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])

		if @listing.update(listing_params)
			flash[:success] = "You have successfully edited list!"
			redirect_to @listing
		else
			flash[:error] = "list was not successfuly edited!"
			render 'edit'
		end
	end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy

		redirect_to listings_path
	end

	# def search
	# 	@listing = Listing.all
	# 	@listing = @listing.location(params[:location]) if params[:location].present?
	# end

	private
	def listing_params
		params.require(:listing).permit(:product_title, :location, :guests_number, :room_type, :amenities, :availability, :price_rates)
	end

	# private
	# def filtering_params(params)
	# 	params.slice(:location)
	# end



end
