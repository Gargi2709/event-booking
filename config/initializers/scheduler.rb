require 'rufus-scheduler'

scheduler = Rufus::Scheduler::singleton


scheduler.every '1day' do
	events = Event.where("date >= ? AND date < ?", Date.current, Date.tomorrow)
	bookings = events.flat_map { |event| event.tickets.flat_map(&:bookings) }
	bookings.map{|booking| ReminderMailer.perform(booking).deliver_now}
end
