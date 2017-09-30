Rails.application.routes.draw do
  resources :rooms do
    resources :targets
    resources :data_points, except: [:new, :edit, :update]
    resources :nodes do
      resources :slots
    end
    resources :climate_control_units
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'rooms#index'
end
