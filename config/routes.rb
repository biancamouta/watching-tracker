Rails.application.routes.draw do

  get "generals/status", to: "generals#status", as: :status_general
  get "generals/search", to: "generals#search", as: :search_general
  resources :generals, only: [:new, :create, :destroy, :edit, :update]
  root to: "generals#index"

end
