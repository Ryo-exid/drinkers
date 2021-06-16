Rails.application.routes.draw do
  devise_for :controllers
  get 'chats/show'
  root "homes#top"
  get "homes/about" => "homes#about"
  get "search" => "search#search"
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
    namespace :admin do
      put "/users/:id/hide" => "users#hide", as: 'users_hide'
    end
  end
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    namespace :admin do
      resources :posts, only: [:destroy]
    end
  end
  get "chat/:id" => "chats#show", as: "chat"
  resources :chats, only: [:create, :destroy]

  put "/users/:id/hide" => "users#hide", as: 'users_hide'

  resources :notifications, only: [:index, :destroy_all] do
    collection do
      delete 'destroy_all'
    end
  end
end