Rails.application.routes.draw do
  resources :event_organizers
  resources :bookings
  resources :customers
  resources :events
  resources :tickets
end
