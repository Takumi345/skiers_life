Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'skies/index'
    get 'skies/show'
    get 'skies/destroy'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'genres/index'
    get 'genres/new'
    get 'genres/create'
    get 'genres/show'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/confirm'
    get 'users/withdraw'
  end
  namespace :public do
    get 'skies/index'
    get 'skies/new'
    get 'skies/create'
    get 'skies/show'
    get 'skies/edit'
    get 'skies/update'
    get 'skies/destroy'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
