class PaymentsController < ApplicationController
  def new
  end
  
  def show
  	  @listing = Listing.find(params[:listing_id])
  	  @reservation = Reservation.find(params[:reservation_id])
  	  @client_token = Braintree::ClientToken.generate
  end


  def create
    @reservation = Reservation.find(params[:reservation_id])
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
     :amount => "10.00", #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
      ReservationsMailer.reservation_email(@reservation).deliver_now
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end

end


end
