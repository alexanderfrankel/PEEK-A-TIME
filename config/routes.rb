Rails.application.routes.draw do
  root "events#index"

  resources :events do
	  resources :days, only: [:new, :create, :destroy] do
		  get 'upvote', to: 'days#upvote'
		  get 'downvote', to: 'days#downvote'
	  end
  end

end
