class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def create?
      event_organizer?  # Assuming you have a method like `event_organizer?` on your User model
    end
  end
end
