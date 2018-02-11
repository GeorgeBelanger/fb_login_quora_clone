Rails.application.routes.draw do
  resources :answers do
	  member do
	    post 'upvote'
	    post 'downvote'
	  end
	end
  resources :questions  do
	  member do
	    post 'upvote'
	    post 'downvote'
	  end
	end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  
  root "questions#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
