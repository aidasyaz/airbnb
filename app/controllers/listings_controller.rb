class ListingsController < ApplicationController

	
	def index

		@listing = Listing.paginate(:page => params[:page], :per_page =>20)
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def new
		@listing = Listing.new
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

	private
	def listing_params
		params.require(:listing).permit(:product_title, :location, :guests_number, :room_type, :amenities, :availability, :price_rates)
	end

end
