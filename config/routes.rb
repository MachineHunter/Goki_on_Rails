Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "maingokis#index"
  devise_for :users

  get "gokicollections/ranking"
  get "gokicollections/restore/:id", to: "gokicollections#restore"
  get "gokicollections/gokiexp"
  post "maingokis/addgold"
  get 'maingokis/index'
  get "maingokis", to: "maingokis#index"
  get "maingokis/gindex/:id", to: "maingokis#gindex"
  delete "gokicollections/destroy_all"
  resources :gokicollections
end
