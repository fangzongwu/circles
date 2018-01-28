Rails.application.routes.draw do
  
	root 'welcome#index'

	resource :users
	resource :sessions

	namespace :admin do 

		root "users#index"

		resources :users do 
			collection do 
				get :search
			end
		end
	end

end
