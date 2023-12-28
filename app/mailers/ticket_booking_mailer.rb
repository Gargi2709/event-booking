class TicketBookingMailer < ApplicationMailer

	def perform(booking)
		@booking = booking
		mail(to: @booking.customer.email, subject: 'Booking Confirmation')
	end
	
end
