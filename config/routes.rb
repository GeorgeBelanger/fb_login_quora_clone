Rails.application.routes.draw do
  resources :avotes, :only => [:new, :create]  do
   member do
	    post 'upvote'
	    post 'downvote'
	  end
	end

  resources :qvotes, :only => [:new, :create]  do
	  member do
	    post 'upvote'
	    post 'downvote'
	  end
	 end
	
  resources :answers, :only => [:new, :create, :edit, :update]
  resources :questions
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, :only => [:new, :create]
  
  root "questions#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
