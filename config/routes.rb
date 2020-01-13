Rails.application.routes.draw do
  get 'users', to: 'users#index'
  get 'home', to: 'home#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'kudos_senders/:recipient_id', to: 'kudos_senders#show'
  post 'kudos_recipients', to: 'kudos_recipients#create', defaults: {format: :json}
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
