Rails.application.routes.draw do
  root 'landlords#home'
  
  resources :categories, only: [:index, :show, :create, :update, :destroy]
  resources :landlords, only: [:index, :show, :create, :update, :destroy, :home]
  resources :reviews, only: [:index, :show, :create, :update, :destroy]
  resources :messages, only: [:create]

  get '/search', to: 'home#search'
  
  get "/support", to: "support#new"
  post "/support", to: "support#create"

  get 'user_sign_up', to: 'user_authentication#sign_up_form'
  post 'insert_user', to: 'user_authentication#create'

  
  get 'edit_user_profile', to: 'user_authentication#edit_profile_form'
  post 'modify_user', to: 'user_authentication#update'
  get 'cancel_user_account', to: 'user_authentication#destroy'
  
  get 'user_sign_in', to: 'user_authentication#sign_in_form'
  post 'user_verify_credentials', to: 'user_authentication#create_cookie'
  get 'user_sign_out', to: 'user_authentication#destroy_cookies'

end
