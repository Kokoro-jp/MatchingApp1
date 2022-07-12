Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  }

  devise_scope :user do
    # get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#index"
  get 'pages/index'
  get 'pages/show'

  resources :rooms
  resources :reservations

  post 'reservations/confirm' #確認画面
  post 'reservations/back'  # 確認画面から「入力画面に戻る」をクリックした時
  post 'reservations/complete' #完了画面
end
