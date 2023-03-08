Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   root to: 'homes#top'
   devise_for :users
   get "/homes/about" => "homes#about", as: "about"
   
resources :users, only: [:edit, :index, :show, :update]
resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
end
