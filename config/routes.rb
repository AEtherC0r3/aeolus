Rails.application.routes.draw do
  resources :data_points
  resources :nodes
  resources :targets
  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
