class EventOrganizer < ApplicationRecord
	has_many :events, dependent: :destroy
	validates :email, uniqueness: true
	validates :phone, uniqueness: true
end
