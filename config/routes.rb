Rails.application.routes.draw do

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
  get  'public/home/about', to: 'public/homes#about', as: 'about'

  namespace :admin do
    resources :genres
    resources :skis do
      resources :ski_comments, only: [:create, :destroy]
    end
    resources :users
  end

  namespace :public do
    get 'users/confirm'
    patch 'users/withdraw'
    resources :genres
    resources :skis do
      resource :favorites, only: [:index, :create, :destroy]
      resources :ski_comments, only: [:create, :destroy]
    end
    resources :users, only: [:index, :new, :create, :edit, :update, :show, :destroy] do
      resource :relationships, only: [:create, :destroy, :followings, :followers]
    end
    get 'relationships/followings'
    get 'relationships/followers'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
