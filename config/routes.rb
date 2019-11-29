Rails.application.routes.draw do

  get "generals/search", to: "generals#search", as: :search_general
  resources :generals, only: [:new, :create, :destroy]
  root to: "generals#index"

end
