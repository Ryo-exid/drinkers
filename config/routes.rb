Rails.application.routes.draw do
  root "homes#top"
  get "homes/about" => "homes#about"
  devise_for :users
  resources :users
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end
