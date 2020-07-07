Rails.application.routes.draw do
	  namespace :api do
	    namespace :v1 do
	    
	    	resources :users

    		# resources :tickets do

    		# 	resources :comments
    		# 	post :claim, to:'claims#create'
    		# 	delete :unclaim, to:'claims#destroy'
    		# end
	   
	    end
	  end

  scope '/auth' do
   post '/signin', to: 'user_token#create'
   post '/signup', to: 'api/v1/users#create'
  end
end
