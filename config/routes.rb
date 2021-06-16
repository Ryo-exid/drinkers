Rails.application.routes.draw do

  root "homes#top"
  get "homes/about" => "homes#about"
  get "search" => "search#search"
  get 'inquiry' => 'inquiry#index' # お問い合わせ
  post 'inquiry/confirm' => 'inquiry#confirm' # 確認画面
  post 'inquiry/complete' => 'inquiry#complete' # 送信完了画面

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

  resources :chats, only: [:show, :create, :destroy]

  put "/users/:id/hide" => "users#hide", as: 'users_hide' # 退会

  resources :notifications, only: [:index, :destroy_all] do
    collection do
      delete 'destroy_all' # 通知全削除
    end
  end
end