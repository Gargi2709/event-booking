class Event < ApplicationRecord
  belongs_to :event_organizer
  has_many :bookings, dependent: :destroy
  has_many :tickets, dependent: :destroy
end
