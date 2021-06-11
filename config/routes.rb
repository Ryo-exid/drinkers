Rails.application.routes.draw do
  get 'chats/show'
  root "homes#top"
  get "homes/about" => "homes#about"
  get "search" => "search#search"
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  get "chat/:id" => "chats#show", as: "chat"
  resources :chats, only: [:create, :destroy]
end