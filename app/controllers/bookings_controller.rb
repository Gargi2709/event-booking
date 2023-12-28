class BookingsController < ApplicationController
  def create
    ticket = Ticket.find(params[:booking][:ticket_id])
    if Customer.find_by(id: params[:booking][:customer_id]).present?
      if ticket.availability >= params[:booking][:quantity].to_i && ticket.event.date >= Time.current
        total = total_ammount(ticket)
         @booking = Booking.new(booking_params)
         @booking.total_price = total
         if @booking.save
           ticket.update( availability: ticket.availability - params[:booking][:quantity].to_i )
           BookingConfirmationWorker.perform_async(@booking.id)
           render json: @booking, status: :created
         else
           render json: @booking.errors, status: :unprocessable_entity
         end
      else
        render json: {message: "Ticket is not available"}
      end
    else
      render json: {message: "Customer is not valid.."}
    end
  end

  private

  def total_ammount(ticket)
    total = ticket.price*params[:booking][:quantity]
  end

  def set_booking
   @booking = Booking.find(params[:id])
  end

  def booking_params
   params.require(:booking).permit(:quantity, :customer_id, :ticket_id)
  end
end
