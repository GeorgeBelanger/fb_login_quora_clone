Rails.application.routes.draw do
  resources :answers
  resources :questions
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  
  root "questions#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
