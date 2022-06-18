Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"
  get '/admin', to: 'admin/homes#top'
  get  '/home/about', to: 'homes#about', as: 'about'

  namespace :admin do
    resources :homes
    resources :genres
    resources :skis
    resources :users
  end

  namespace :public do
    get 'users/confirm'
    patch 'users/withdraw'
    resources :genres
    resources :skis do
      resource :favorites, only: [:create, :destroy]
      resources :ski_comments, only: [:create, :destroy]
    end
    resource :users do
      resource :relationships, only: [:create, :destroy, :followings, :followers]
    end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
