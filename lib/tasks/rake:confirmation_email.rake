namespace :confirmation_email do
	task :confirmation_email_customer => :environment do
		events = Event.where('date <= ?', 2.hours.from_now)
		bookings = events.flat_map { |event| event.tickets.flat_map(&:bookings) }
		timestamp = 2.hours.from_now

		# Ensure you pass a timestamp as the first argument to perform_at
		BookingConfirmationJob.perform_at(timestamp, bookings)
	end
end
