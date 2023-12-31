Rails.application.routes.draw do


scope module: :public do
    get 'customers/mypage' => "customers#show"
    get 'customers/information/edit' => "customers#edit"
    patch 'customers/information' => "customers#update"
    get 'customers/information/withdraw' => "customers#withdraw", as: "withdraw"
    patch 'customers/information/unsubscribe' => "customers#unsubscribe", as: "unsubscribe"

    resources :items

    get 'orders/new' => "orders#new"
    post 'orders/confirm' => "orders#confirm"
    get 'orders/thanks' => "orders#thanks"
    get 'orders' => "orders#index"
    post 'orders' => "orders#create"
    get 'orders/:id' => "orders#show", as: "order"

    resources :cart_items do
      collection do
        delete "destroy_all"
      end
    end


end

 root to: 'homes#top'
    get '/homes/about' => "homes#about", as: "about"

namespace :admin do
  resources :items
  resources :genres, only: [:index,:create,:edit,:update ]
  resources :customers, only: [:index,:show, :edit]
   patch 'customers/information/:id' => "customers#update", as: "edit"
  resources :orders
  get '/' => "homes#top"
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
