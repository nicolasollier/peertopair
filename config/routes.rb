Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get '/events/:id/cancel', to: 'events#cancel', as: 'cancel_event'

  resources :events do
    resources :venue_rankings, only: [:new, :show, :create]
    resources :user_events
  end
end
