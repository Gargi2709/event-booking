class BookingConfirmationWorker
  include Sidekiq::Worker

  def perform(arg)
    @booking = Booking.find(arg)
    TicketBookingMailer.perform(@booking).deliver_now
  end
end