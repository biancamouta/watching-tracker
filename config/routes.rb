Rails.application.routes.draw do

  resources :lists
  post "lists/:list_id/add", to: "lists#add_serie_to_list"
  delete "lists/:list_id/:general_id", to: "lists#delete_serie_from_list"
  get "generals/status", to: "generals#status", as: :status_general
  get "generals/in_progress", to: "generals#in_progress", as: :in_progress_general
  get "generals/done", to: "generals#done", as: :done_general
  get "generals/cancelled", to: "generals#cancelled", as: :cancelled_general
  get "generals/waiting", to: "generals#waiting", as: :waiting_general
  get "generals/search", to: "generals#search", as: :search_general
  resources :generals, only: [:new, :create, :destroy, :edit, :update]
  root to: "generals#index"

end
