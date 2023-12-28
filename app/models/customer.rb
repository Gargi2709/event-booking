class Customer < ApplicationRecord
	has_many :bookings, dependent: :destroy
	validates :email, uniqueness: true
end
