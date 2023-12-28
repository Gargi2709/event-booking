class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def create
    if EventOrganizer.find_by(id: params[:event][:event_organizer_id]).present?
      if !Event.where(venue: params[:event][:venue], date: params[:event][:date]).present?
        @event = Event.new(event_params)
        if @event.save
          render json: @event, status: :created
        else
          render json: @event.errors, status: :unprocessable_entity
        end
      else
        render json: {message: "Event is already present"}
      end
    else
      render json: {message: "Event Organizer is not Present..."}
    end
  end

  def show
    render json: {event: @event, event_ticket: @event.tickets}
  end

  def update
    if params[:event_organizer_id].to_i == @event.event_organizer_id
      @event.update(event_params)
      render json: {message: "Event is successfully updated..", event: @event}
    else
      render json: {message: "Event Organizer is not available"}
    end
  end

  def destroy
    if params[:event_organizer_id].to_i == @event.event_organizer_id
      @event.delete
      render json: {message: "Event successfully deleted."}
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def authorize_event_creation
    authorize Event
  end

  def event_params
    params.require(:event).permit(:name, :date, :venue, :event_organizer_id)
  end
end
