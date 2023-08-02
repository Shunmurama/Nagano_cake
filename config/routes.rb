Rails.application.routes.draw do
scope module: :public do
    get 'customers/mypage' => "customers#show"
    get 'customers/information/edit' => "customers#edit"
    patch 'customers/information' => "customers#update"
    get 'customers/information/withdraw' => "customers#withdraw"
    patch 'customers/information' => "customers#unsubscribe"

    resources :items


end

 root to: 'homes#top'
    get '/homes/about' => "homes#about", as: "about"

namespace :admin do
  resources :items
  resources :genres, only: [:index,:create,:edit,:update ]
end





  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:encrypted_password], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
