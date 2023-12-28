class TicketsController < ApplicationController
  before_action :set_event

    def create
      @ticket = @event.tickets.new(ticket_params)

      if @ticket.save
        render json: @ticket, status: :created
      else
        render json: @ticket.errors, status: :unprocessable_entity
      end
    end

    private

    def set_event
      @event = Event.find(params[:event_id])
    end

    def ticket_params
      params.require(:ticket).permit(:name, :availability, :price)
    end
end
