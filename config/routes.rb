Rails.application.routes.draw do
  devise_for :users

  get '/404', :to => "errors#not_found"
  get '/422', :to => "errors#unacceptable"
  get '/500', :to => "errors#server_error"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated :user do 
  	root to: "pages#dashboard", as: "authenticated_user"
  end

  authenticate :user do 
    resources :properties
     get '/select_property' => "properties#select"
  end

  root to: "pages#home"
  
end
