Rails.application.routes.draw do
  get 'maingokis/index'
  get "maingokis", to: "maingokis#index"
  delete "gokicollections/destroy_all"
  resources :gokicollections
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
