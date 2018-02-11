Rails.application.routes.draw do
  resources :avotes do
   member do
	    post 'upvote'
	    post 'downvote'
	  end
	end
  resources :qvotes  do
	  member do
	    post 'upvote'
	    post 'downvote'
	  end
	 end
  resources :answers 
  resources :questions
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  
  root "questions#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
