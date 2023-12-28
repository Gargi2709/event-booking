class BookingConfirmationJob
  include Sidekiq::Worker

  def self.perform_at(timestamp, bookings)
     # Your job implementation here
     bookings.map{|booking| TicketBookingMailer.perform(booking).deliver_now}
   end
end