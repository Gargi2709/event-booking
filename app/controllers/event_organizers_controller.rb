class EventOrganizersController < ApplicationController
  before_action :find_event_organizer, only: [:update, :destroy]

  def create
    event_organizer = EventOrganizer.create(event_organizer_params)

    if event_organizer.save
      render json: event_organizer, status: :created
    else
      render json: event_organizer.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    event_organizer = event_organizer.update(event_organizer_params)

    if event_organizer.present?
      render json: event_organizer, status: :created
    else
      render json: event_organizer.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def event_organizer_params
    params.require(:event_organizer).permit(:name, :email, :phone)
  end

  def find_event_organizer
    event_organizer = EventOrganizer.find(params[:id])
  end
end
