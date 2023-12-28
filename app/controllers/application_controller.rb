class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

	include Pundit

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	def user_not_authorized
		render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden
	end
end
