Rails.application.routes.draw do
  resources :rooms do
    member do
      patch :toggle_enabled
    end

    resources :targets
    resources :data_points, only: [:index, :show, :destroy]
    resources :nodes do
      resources :slots
    end
    resources :climate_control_units
  end

  # For API requests from the nodes
  resources :data_points, only: :create
  get 'nodes/:api_key', to: 'nodes#get_states'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'rooms#index'
end
