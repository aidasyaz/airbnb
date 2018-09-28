class ReservationsMailer < ApplicationMailer
default from: 'ren.syasya24@gmail.com'
  
  def reservation_email(reservation)
  	@user = reservation.user
  	@host =  reservation.listing.user
  	@listing = reservation.listing
  	@reservation = reservation
  	

  	mail(to: 'ren.syasya24@gmail.com', 
  		subject: "You're going to 
  		#{@listing.location }")
  end

end
