class ReservationJob < ApplicationJob
  queue_as :default

  def perform(reservation)
    ReservationMailer.reservation_email(@reservation).deliver_now
  end
end
