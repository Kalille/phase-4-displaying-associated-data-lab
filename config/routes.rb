Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :users, only: [:show]
  get '/departments', to: 'departments#index'
  get '/comics', to: 'comics#search_comics'
end
